From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 28 Nov 2013 18:53:57 +0100
Subject: [Buildroot] [PATCHv3 2/5] core: allow external
 Config.in/makefile code to be integrated
In-Reply-To: <20131128172357.1417a881@skate>
References: <1385591508-4174-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385591508-4174-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKgWKz_p3ckA1999zxava2TG=SF5qLjqNh7mmygv36Zfg@mail.gmail.com>
 <20131128172357.1417a881@skate>
Message-ID: <CAHXCMMJ9M2m_EU0uweQjoEba1JObQWB43NYM31SXTvMxtWQmKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/28 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> Dear Samuel Martin,
>
> On Thu, 28 Nov 2013 14:24:35 +0100, Samuel Martin wrote:
>
> > In this new version of this patch set, the all target and host
> > packages entries end up under the "Target packages" menu.
> > In my use of this feature, I also have a couple of host tools to
> > integrate. So, how about having adding the following source line in
> > package/Config.in.host:
> > ---
> > source "$BR2_EXTERNAL/package/Config.in.host"
> > ---
> > Of course, this requires to add an
> > empty support/dummy-external/package/Config.in.host file.
>
> This means the user would always have to create both package/Config.in
> and package/Config.in.host, which gets annoying.

Yes, that's the only drawback of this.


> That's why in the v2 I
> did include $(BR2_EXTERNAL)/Config.in, without enforcing a
> $(BR2_EXTERNAL)/package/ subdirectory, and leave more freedom to the
> user. However, several people at the ELCE meeting said that we should
> enforce the package/ directory, and therefore only include
> $(BR2_EXTERNAL)/package/Config.in.
>
> Just curious, why can't you simply add your host packages also in
> $(BR2_EXTERNAL)/package/Config.in ? It's not because the main Buildroot
> doesn't do it this way that you can't do it in your BR2_EXTERNAL
> directory.
>
Well, right now, most of the packages I put in my BR2_EXTERNAL tree are host
tools to generate images.

With the previous version of this serie, the new menu entry was added at
the top level
of menuconfig, in which I added 2 submenus: "Target packages" and "Host
packages".
It was rather clear that all "company" stuff goes into this menu.

With the v2, I was a bit lost at first, the "company" menu got moved under
"Target packages". So, now I have a menu tree like this:

---
Main menu
  ...
  Target packages --->
    ...
    Company --->
      Target packages --->
      Host packages --->
  ...
  Host packages --->
---

It does not hurt that much, but it's not really nice IMHO.

I agree that maybe most of the users may not need to add host packages;
that does not mean there is no room for improvement ;)

BTW, to generate this/these Config.in{,host} files in the BR2_EXTERNAL tree,
I already have a script scanning the tree and updating these files, it
could be
included as a support script as well.


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131128/bf3f9c48/attachment-0001.html>
