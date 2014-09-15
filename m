From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 15 Sep 2014 15:00:40 +0300
Subject: [Buildroot] [PATCH] screen: bump to version 4.2.1
In-Reply-To: <5832091.sHdIXmaBbS@hyperion>
References: <1410748789-4094-1-git-send-email-maarten@treewalker.org>
 <5832091.sHdIXmaBbS@hyperion>
Message-ID: <20140915120040.GB2452@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maarten,

On Mon, Sep 15, 2014 at 01:54:05PM +0200, Maarten ter Huurne wrote:
> The Buildroot package of GNU Screen installs the binary as setuid root; both 
> the old (4.0.3) and the new (4.2.1) version do. After having spent some time 
> reading the Screen source code, I wouldn't trust it with root privileges on 
> any system where security is relevant.
> 
> I haven't seen (or looked for) any actual code that could be exploited, just 
> a code base that is really old, under-maintained and quite complex from all 
> the workarounds it contains. So it resembles the OpenSSL situation, although 
> it is not quite that bad.
> 
> It seems multiuser mode is the feature that requires Screen to be setuid 
> root. Which means that without setuid root, Screen works fine but users can 
> only connect to their own sessions.

Thanks for looking into this.

> I would like some guidance on how to proceed here:
> - leave the setuid flag on
> - always clear the setuid flag post-install
> - make it a configuration option

I vote for this option, defaulting to the current status (i.e. setuid on).

> - ...?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
