From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 May 2016 13:17:39 -0300
Subject: [Buildroot] gstreamer-1.0 and egl
In-Reply-To: <b35e550d-8cf4-5912-e700-b050ab498e0c@gmail.com>
References: <63233783-a7e5-8971-7403-4f52cb5af733@gmail.com>
 <57487050.4040309@zacarias.com.ar>
 <b35e550d-8cf4-5912-e700-b050ab498e0c@gmail.com>
Message-ID: <57487323.8090101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/05/16 13:11, Marco Trapanese wrote:

> Il 27/05/2016 18:05, Gustavo Zacarias ha scritto:
>> wayland-egl is normally provided by open EGL implementations, such as
>> mesa. It's basically small glue code into the EGL surface for wayland.
>> I'm not aware of closed EGL providers providing it (basically
>> wayland-egl.pc and minions).
>> It may be possible to just hack and use the mesa bits with closed ones
>> since it's pretty generic, however i've never pursued this.
>
> I'm not sure to fully understand this - I apologize.
> What do you mean with "closed providers"?
>
> In my system I selected rpi-userland as egl "provider", I guess.
> Are you suggesting to remove rpi-userland and select mesa3d, w/ Gallium
> vc4 driver, OpenGL EGL/ES packages?
> I'm afraid about the compatibility with Qt5/QML/Webkit...
>
> Best regards
> Marco

Hi Marco.
Closed = Binary/BLOB = rpi-userland for example.
For open drivers mesa DOES provide wayland-egl which is the tiny missing 
piece for this to build/work.
But from the closed ones i've seen (rpi-userland, nvidia and mali i 
believe) they don't, so in my limited experience: i have yet to see any 
!= mesa provide it.
I have yet to succeed in building a vc4-enabled kernel that works right 
for rpi, i didn't give it much time either (tried circa 4.4-4.5 kernels, 
no 4.6 yet). Vanilla kernels require patches, mostly for dts-enabling 
them, from a quick grep even for 4.6.
Regards.
