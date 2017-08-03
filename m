From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Thu, 3 Aug 2017 10:30:59 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-08-02
In-Reply-To: <20170803063049.45E0621EC8@mail.free-electrons.com>
References: <20170803063049.45E0621EC8@mail.free-electrons.com>
Message-ID: <a8c9e92b-38f9-88c2-c423-99f946fa5571@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Howdy,

On 08/02/2017 11:30 PM, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2017-08-02
> ================================
> 

...
   
>     mips64el |                  qt5base-5.9.1 | NOK | http://autobuild.buildroot.net/results/6f3c2fcb0a44cd13ef4c73822d4d08f923291099 |     

For reference, I opened an upstream Qt bug [1] about this.  This build log is
not strictly identical, but looks to be the same problem.  I believe the
issue is gtk3 is properly auto detected by Qt build in order to build an
optional Qt gtk3 plugin, but what it really needs is gtk3 compiled with X11.
So, when gtk3 is built without X11 in buildroot, the Qt build fails.

Any direction on whether this should be solved:
1) in buildroot as config/build dependency (seems odd to make a dependency on
   X11 for qt5base if gtk3 is enabled),
2) patch Qt,
3) by explicitly disabling building gtk3 theme support in qt5base (instead of
   being automatic),
4) with some combination of the above.

[1] https://bugreports.qt.io/browse/QTBUG-62101

...

Josh
