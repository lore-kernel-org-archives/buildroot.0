From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 19 Aug 2016 13:45:50 -0700
Subject: [Buildroot] Unable to choose libgtk3 when using rpi-userland
	package
In-Reply-To: <47b66f9e09c23b835237d728463c4095@zacarias.com.ar>
References: <trinity-13a6383e-07ec-45b6-b051-a97025e073e3-1471607022160@3capp-gmx-bs60>
 <08E7F0B7-5937-4810-8D59-4E5B2F98D5B9@gmail.com>
 <47b66f9e09c23b835237d728463c4095@zacarias.com.ar>
Message-ID: <3DA761BA-58F8-4124-A576-1DAE5908462B@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Aug 19, 2016, at 12:35 PM, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> 
> On 2016-08-19 14:34, Khem Raj wrote:
> 
>>> On Aug 19, 2016, at 4:43 AM, Michael Toldo <Michael_Toldo@gmx.net>
>>> wrote:
>>> Hi everybody,
>>> I'm trying to set up buildroot for my Raspberry Pi so I can use it
>>> as a lightweight kiosk device. For this I want to install Midori
>>> which is based on the libgtk3. When using rpi-userland (OpenGL is
>>> included there) I cannot select the libgtk3 package. Following info
>>> is displayed: *** libgtk3 needs an OpenGL or OpenGL EGL backend
>>> provided by mesa3d ***
>> Look into the build its most probably not able to deduce that userland
>> supports it because the little tests it does for deciding that are
>> failing.
> 
> Hi.
> The problem at the bottom is that rpi-userland doesn't provide wayland-egl which is required glue for wayland/weston support.
> Right now the only declared provider of wayland-egl in buildroot is mesa, which means he'd have to use vc4-drm instead of the broadcom blobs.
> Yann is working on making this a virtual since other EGL providers will show up.
> Currently we lack a vc4-drm sample defconfig, i have a WIP but it isn't quite functional yet.
> Regards.

here is collection of patches for wayland support with userland

https://github.com/kraj/userland/commits/kraj/master

We use it with meta-raspberrypi in OE and it works well.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160819/92904bc6/attachment.asc>
