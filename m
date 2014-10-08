From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 20:46:19 +0200
Subject: [Buildroot] [PATCH 1/5] dash: bump to version 0.5.8-1
In-Reply-To: <543580C6.1090600@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 08 Oct 2014 15:21:58 -0300")
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
 <87eguieaky.fsf@dell.be.48ers.dk> <5435748A.3090106@zacarias.com.ar>
 <87k34acu9a.fsf@dell.be.48ers.dk> <543580C6.1090600@zacarias.com.ar>
Message-ID: <87y4sqbds4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 > On 10/08/2014 03:05 PM, Peter Korsgaard wrote:
 >> Random is not good, so I suggest we either:
 >> 
 >> - Only do it for bash like today

 > That's not an option: non-usable default rootfs if there's no /bin/sh.

But a buildroot config without busybox is quite unlikely.


 >> - Provide an option for the user to select

 > It's possible, probably best in System Configuration an option that
 > selects the appropiate package.
 > I wouldn't pull in busybox though, only make the option available if
 > BR2_PACKAGE_BUSYBOX.
 > And make the symlink in target-finalize to avoid touching the packages
 > much (actually making them simpler).

Yes, we can do something like that if there's interest / need. I
personally don't care enough about it do it myself, but I do want
reproducible builds.

A real config with multiple (non busybox) shells is imho quite unlikely
though.


 >> - Decide on a fixed priority order (E.G. busybox->dash->zsh->bash) and
 >> tell people to use a post-build script if they are not happy with it

 > It's a pretty arbitrary decision, many people would balk at the idea of
 > having bash as default yet they may need it for other uses.

Sure it is arbitrary, but that's what we have today and I haven't heard
anybody complaining.

-- 
Bye, Peter Korsgaard
