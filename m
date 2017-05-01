From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 1 May 2017 10:38:56 +0300
Subject: [Buildroot] [PATCH] bluez5_utils: fix build of gatttool
In-Reply-To: <20170501092142.216bc5b9@free-electrons.com>
References: <813b44550d7406827f9307514a8386b4462b854d.1493620107.git.baruch@tkos.co.il>
 <20170501092142.216bc5b9@free-electrons.com>
Message-ID: <20170501073856.cgnhegilk7dqvg3v@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, May 01, 2017 at 09:21:42AM +0200, Thomas Petazzoni wrote:
> On Mon,  1 May 2017 09:28:27 +0300, Baruch Siach wrote:
> > Since BlueZ 5.44 gatttool is hidden behind the --enable-deprecated configure
> > option.
> > 
> > Also, update the help text with the new status of gatttool.
> > 
> > Fixes:
> > http://autobuild.buildroot.net/results/ddb/ddb975c9e1475fee1da63cb21240d8d59b161076/
> > http://autobuild.buildroot.net/results/19a/19adc0aa5a7e48119ef4ba25ba0403867f74f678/
> > http://autobuild.buildroot.net/results/9bd/9bd8e13ddffdd0631ddca30ec40cc4664729b0cb/
> > 
> > Cc: Marcin Bis <marcin@bis.org.pl>
> > Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> We have lots of patches pending on bluez5_utils, to solve this issue
> and others. It's not clear what is the overall plan, as all the patches
> have been sent separately (i.e not in a series).
> 
> See
> https://patchwork.ozlabs.org/project/buildroot/list/?submitter=&state=&q=bluez&archive=&delegate=.
> 
> Essentially, your patch is the third one to solve the gattool problem.

This patch is essentially equivalent to that of Bernd[1], expect that is also 
updates the help text.

I think Andy's suggestion[2] is better than both, but it needs some more work 
to address Peter's comments, and maybe split into separate tools and plugins 
patches. I also think that we should group all deprecated tools together, and 
replace the BR2_PACKAGE_BLUEZ5_UTILS_GATTTOOL option with 
BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED.

I don't think we should remove gatttool installation as Sam suggests[3]. E.g. 
the hciattach tool is also deprecated upstream, but it is unfortunately still 
required for many real world Bluetooth installations.

I'll take over Andy's patch as time permits.

[1] https://patchwork.ozlabs.org/patch/736377/

[2] https://patchwork.ozlabs.org/patch/741645/

[3] https://patchwork.ozlabs.org/patch/748801/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
