From: Nathanael D. Noblet <nathanael@gnat.ca>
Date: Wed, 31 Jan 2007 14:00:25 -0700
Subject: [Buildroot] Xorg questions
In-Reply-To: <45C0F27F.1000700@de-brouwerij.be>
References: <45C0F27F.1000700@de-brouwerij.be>
Message-ID: <45C10369.7070301@gnat.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Koenraad lelong wrote:
> Hi,
> I'm trying to run an application under Xorg/X11. It needs (amongst 
> others) libXi and libXinerama. I wonder why these aren't installed in 
> the image, although they are present in the staging dir. The same for xterm.
> If I manually copy those libraries to their destination 
> (/usr/X11R6/lib), the application can't find the libraries. I thought 
> /etc/ld.so.conf took care of this (it contains /usr/X11R6/lib). If I am 
> in the directory where the application is "ldd" reports those libraries 
> not found. If I go to the directory with the libraries "ldd" finds those 
> libraries, but starting the application (startx /path/to/appname) from 
> there does not work.
> What am I missing ?
>   
Once copied into the destination directory, did you run ldcache to 
update the ld.so.conf cachefile?
