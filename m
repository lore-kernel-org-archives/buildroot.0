From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 28 Dec 2011 11:26:54 +0100
Subject: [Buildroot] Git authentication
In-Reply-To: <DUB105-W16773EBDB1BC688C44BDE7CDAC0@phx.gbl>
References: <DUB105-W16773EBDB1BC688C44BDE7CDAC0@phx.gbl>
Message-ID: <CAEYzJUHGE9TpY6ssFxJNEQ-UHuo4EPYnYskuadX35wSqog9zPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 December 2011 10:10, Janne H?meenaho <jannehameenaho@hotmail.com> wrote:
> Hi,
>
> I use Buildroot in my project that uses three repositories on the same
> server. Thing is, when I launch Buildroot 'make', at some point I need to
> type my username and password, twice. That is annoying since I basically
> have to watch my build to make it finish at some point.
>
> A question is, can I somehow make Buildroot to know my git password and
> username? If there's any solution other than Buildroot related, please let
> me know.

The solution is public-key based authentication (password-less ssh).
Minimal instructions:

$ ssh-keygen
$ ssh-copy-id myserver

Now you should be able to log into myserver without a password.

Best regards,
Bj?rn Forsman
