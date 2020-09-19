From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 15:03:30 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/qt5webengine: needs
 libxkbcommon
In-Reply-To: <20200918233708.335f87fd@gmx.net>
References: <20200918195852.6999-1-ps.report@gmx.net>
 <20200918195852.6999-3-ps.report@gmx.net>
 <20200918233708.335f87fd@gmx.net>
Message-ID: <20200919150330.2a9e798e@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 18 Sep 2020 23:37:08 +0200
Peter Seiderer <ps.report@gmx.net> wrote:

> > Notes:
> >  - send as extra patch as I am not sure if the failure is caused by
> >    the version bump and/or by a combination from my buildroot config
> >    (update: qt5webengine-5.15.0 with the same buildroot config
> >    compiles fine without libxkbcommon, will try qt5webengine-5.15.1
> >    with a striped down buildroot config)  
> 
> Same failure wihtout libxkbcommon with reduced defconfig and qt5webengine-5.15.1:

So in other words, libxkbcommon is a new requirement since 5.15.1, and
this patch should be merged with the 5.15.1 bump ?

Which seems to match pretty well with the following change that took
place between 5.15.0 and 5.15.1:

commit 585da6f74012bd09e8a873080e368cff99c97cbf
Author: Allan Sandfeld Jensen <allan.jensen@qt.io>
Date:   Mon May 11 14:35:40 2020 +0200

    Remove xkbcommon hack
    
    We fixed Chromium to compile with the right include paths, and the
    system package is already required by QtGui.
    
    Fixes: QTBUG-83693
    Change-Id: I8256e67cf0fca3aa71df6d6bad1b13436c689b8a
    Reviewed-by: Michal Klocek <michal.klocek@qt.io>

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
