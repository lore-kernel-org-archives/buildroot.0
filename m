From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 11 Mar 2016 08:47:07 -0300
Subject: [Buildroot] [PATCH] mesa3d: add intel gallium driver support
In-Reply-To: <87wpp9i6se.fsf@dell.be.48ers.dk>
References: <1457632891-4354-1-git-send-email-gustavo@zacarias.com.ar>
 <8760wum7dj.fsf@dell.be.48ers.dk> <56E1D44F.70807@zacarias.com.ar>
 <3979rcxl7o.ln2@ID-313208.user.individual.net>
 <871t7hjmol.fsf@dell.be.48ers.dk> <56E2A91A.1030509@zacarias.com.ar>
 <87wpp9i6se.fsf@dell.be.48ers.dk>
Message-ID: <56E2B03B.9000701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/03/16 08:38, Peter Korsgaard wrote:

> I actually think the comment is wrong. Googling around for wayland /
> mesa / intel seems to show a bunch of references to people using dri
> drivers and not gallium:
>
> https://wayland.freedesktop.org/building.html
> https://lists.freedesktop.org/archives/wayland-devel/2011-February/000702.html
> https://lists.freedesktop.org/archives/wayland-devel/2012-August/004832.html
> https://gist.github.com/tmpvar/6218568

Many people use xwayland hence care (or don't, depending on perspective) 
about lingering x11 stuff around.
The end reason is libgtk3 with the wayland and/or broadway backend, 
newer gtk3 versions require some form of *GL support provided by the 
libepoxy wrapper.
libepoxy in turn needs a real GLX and/or EGL provider, GLX is a 
no-brainer, it requires X11. EGL on the other hand does not.
With some patching (sent) libepoxy can be built X11-less to only handle 
EGL, after all who wants a gtk3 with wayland carrying x11 luggage? (when 
building libgtk3 with only the wayland and/or broadway backends)
Now, since newer libgtk3 versions mandate some form of GL support, which 
is wrapped by libepoxy and provided by mesa, doesn't it make sense that 
said GL support is accelerated?
Regards.
