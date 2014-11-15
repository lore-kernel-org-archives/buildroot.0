From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Nov 2014 09:28:46 +0100
Subject: [Buildroot] github helper is broken
In-Reply-To: <20141113210519.GE3641@free.fr>
References: <20141113182328.GC3641@free.fr>
 <CAAXf6LVZO90SpiTm-PpOxBQ3GHLHtd=WvYp96wVee59tKYd9qQ@mail.gmail.com>
 <20141113210519.GE3641@free.fr>
Message-ID: <CAHXCMMJQGuK-LXU=5UHwzTSzL=GKNzNtbfj8dJnhORbXuXCjXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Thu, Nov 13, 2014 at 10:05 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Thomas, All,
>
> On 2014-11-13 20:54 +0100, Thomas De Schampheleire spake thusly:
>> On Thu, Nov 13, 2014 at 7:23 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > The github helper is now broken, because GitHub changed their download
>> > scheme, again.
>
> The isue has been resolved on the GitHub side: the current scheme we use
> works again.
>
> Still, we should strive at finding a long-term solution that is not
> subject to such massive breakage.
>
> [--SNIP--]
>> Shouldn't we (in addition to actions as discussed below) discuss the
>> issue with Github? They may understand our concerns, which surely are
>> present for other build systems as well.
>
> Yes, Samuel has volunteered into contacting them, and Maxime named a
> name. ;-)
>

I've contacted github yesterday and got an answer in 2h! (pretty
responsive :-]).

They suggest to use the github APIs to get the download url.

<quote>
  You can use the repository contents API to get a stable download
link. However, your client will need to be able to follow 302
redirects to use this link.

  https://developer.github.com/v3/repos/contents/#get-archive-link

  Let me know if you have any other questions.
</quote>

I'm not sure the github APIs match all our needs, especially WRT the
url ending with the tarball filename...

Maybe we need to extend our download framework to support such cases,
it might be also useful for other forges.


Regards,

-- 
Samuel
