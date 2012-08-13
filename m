From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Aug 2012 09:46:46 +0200
Subject: [Buildroot] [PATCH 11/36] package/qemu: new package
In-Reply-To: <CALR4fELL58pS31Ur4v-h30ok9q1ibx3QzxKuxz3HJuY+vOqVbA@mail.gmail.com>
References: <1344815664-28138-1-git-send-email-yann.morin.1998@free.fr>
 <1344815664-28138-11-git-send-email-yann.morin.1998@free.fr>
 <CALR4fELL58pS31Ur4v-h30ok9q1ibx3QzxKuxz3HJuY+vOqVbA@mail.gmail.com>
Message-ID: <201208130946.46299.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Diego, All,

On Monday 13 August 2012 09:22:32 Diego Iastrubni wrote:
> Let me understand this: you are trying to build QEMU for the host ?

Nope, it's meant to run on the target.

A long-term goal of this is to try to build a libvirt-based system to run
a "VM-farm" rather than use a complete distro. Most probably, it will be
a proof-of-concept rather than a real solution, but hey, one never knows
before trying.

Of course, the QEMu package could be extended to run on host, so you
can run your images, but that would mean that a lot of packages would
need their host- counterparts, which is currently not the case.

Besides, it does not really make sense. Just create a new BR config which
targets your host, chroot into that (or build static). That's actually
what I'm doing, in fact! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
