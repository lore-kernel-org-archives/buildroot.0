From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jan 2016 13:24:17 +0100
Subject: [Buildroot] [PATCH 1/2] qt/qt5base: force gstreamer on configure
In-Reply-To: <5694E89C.30807@ecagroup.com> (Julien CORJON's message of "Tue,
 12 Jan 2016 11:50:53 +0000")
References: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
 <20160110161902.GF3460@free.fr> <5694E89C.30807@ecagroup.com>
Message-ID: <8760yz9ea6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien CORJON <corjon.j@ecagroup.com> writes:

Hi,

 > Peter already patch gstreamer for qt5base and he have removed 
 > gstreamer0.1 support[1]. I'm not sure this was the good solution because 
 > gstreamer0.1 is still the default choise for Qt[2] but no buildroot user 
 > seems to complain about that.

As I explained in the commit message, the reason for disabling the
gstreamer 0.10.x support was that it was broken in qt5multimedia. If
this is (or gets in the future) fixed, then I have no problem adding it
again.

With that said, we should use prefer gstreamer 1.x support over 0.10.x
if both are enabled.

-- 
Venlig hilsen,
Peter Korsgaard 
