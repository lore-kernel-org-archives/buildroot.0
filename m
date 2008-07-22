From: Wade Berrier <wberrier@gmail.com>
Date: Tue, 22 Jul 2008 12:03:33 -0600
Subject: [Buildroot] [PATCH] Fix util-linux dependencies
In-Reply-To: <20080722151011.GA18680@real.realitydiluted.com>
References: <bbbeeccd0807220724p4ba4f00epbf48eacb73a28f9e@mail.gmail.com>
	<bbbeeccd0807220739l51feb073pb6ebcc0726f16a53@mail.gmail.com>
	<20080722151011.GA18680@real.realitydiluted.com>
Message-ID: <bbbeeccd0807221103k5fd11b6fre850cf553f64742@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Jul 22, 2008 at 9:10 AM,  <sjhill@realitydiluted.com> wrote:
> On Tue, Jul 22, 2008 at 08:39:14AM -0600, Wade Berrier wrote:
>>
>> On Tue, Jul 22, 2008 at 8:24 AM, Wade Berrier <wberrier@gmail.com> wrote:
>> > util-linux appears to depend on RPC support.
>> >
> Before making a wholesale change like this, you should probably look at
> the 'configure' and 'MCONFIG' files and discover exactly what RPC
> support is needed. If changing a config option to not include certain
> utilities depending on RPC is possible, then the preferred method is to
> add a patch for that instead of blindly enabling an option for the
> entire buildroot.

This patch came about because I noticed that util-linux was failing to
build at the link stage.  I looked up the symbols and it turns out
they are rpc calls. (probably nfs mount related)

So, I basically copied the same mechanism that nfs-utils uses to only
be availalbe if RPC is enabled.

But, as previously mentioned, since most people are probably going to
use busybox in lieu of util-linux, I don't see this dependency
affecting that many people (and at least it fixes the build, which is
currently broken).

Otherwise, if it's really important to have util-linux without rpc I
can go dig some more and resubmit.

Thanks!

Wade
