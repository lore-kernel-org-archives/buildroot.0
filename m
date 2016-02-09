From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 9 Feb 2016 10:18:48 -0300
Subject: [Buildroot] [PATCH] webkitgtk24: fix building with rpi egl/gles
In-Reply-To: <20160209114533.159871e2@free-electrons.com>
References: <1454971920-18533-1-git-send-email-gustavo@zacarias.com.ar>
 <20160209114533.159871e2@free-electrons.com>
Message-ID: <56B9E738.2010107@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/16 07:45, Thomas Petazzoni wrote:

> Isn't it possible to use pkg-config ? We install egl.pc and glesv2.pc
> from all our OpenGL implementations specifically for this reason.
>
> Thanks!
>
> Thomas

Hi.
Ehhh sure, though i did find it odd that many others users of these 
don't do it, like kodi, gst-omx, libcec and gst1-plugins-bad.

Care to look at http://patchwork.ozlabs.org/patch/564312/ as well since 
it fixes the other webkitgtk24 build failure? (unknown/dependencies, 
plus it's also nice to save users some crazyness).

http://patchwork.ozlabs.org/patch/564313/ might be nice as well to 
legacy the midori https option since it becomes redundant.

(these two are backports of 2.10.x which doesn't make sense to submit 
until libgtk3 is bumped/wayland fixed).

Regards.
