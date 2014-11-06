From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 06 Nov 2014 13:16:19 -0300
Subject: [Buildroot] Creation of /etc/dropbear
In-Reply-To: <CAAXf6LXOFHMjbFpEe5QF1v9KhfXtnzZUsPRs+Dy1kxy7mhcfWA@mail.gmail.com>
References: <545B9173.9080502@lucaceresoli.net>
 <CAAXf6LXOFHMjbFpEe5QF1v9KhfXtnzZUsPRs+Dy1kxy7mhcfWA@mail.gmail.com>
Message-ID: <545B9ED3.7000802@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/06/2014 12:29 PM, Thomas De Schampheleire wrote:

> In my case, the rootfs is also not persistent, but mounted read-write.
> In this case, I have an init script that restores the keys from
> persistent storage into /etc/dropbear and an exit script that saves
> the keys to persistent storage. All this after checking that the keys
> are valid using dropbearkey.
> 
> If you could mount your roofs as read-write, then the same approach
> could be taken, or alternatively the symlink could be created from an
> init script.
> 
> Of course, when mounting the rootfs truly read-only, neither approach works.

Overlayfs /etc, it won't matter if root is RO in that case.
(alternatively aufs or other implementation as well).
Also you could bind-mount /etc/dropbear if it's a directory (which it is
given what the package does) from some other rw directory of your choosing.
Regards.
