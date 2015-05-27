From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 May 2015 11:51:12 +0200
Subject: [Buildroot] sky2 not created
In-Reply-To: <CAJtzDg85zxiYo7ntyHS_=pGorTyMjaR=zogDRdy_NaxWZKHikg@mail.gmail.com>
References: <CAJtzDg-NoVNk_W8CnV0y0sY+dhZNCKTu66tfePnyUoDNj+bTeg@mail.gmail.com>
 <20150527094643.0dcb2107@free-electrons.com>
 <CAJtzDg9LiZjeTJcRXp=Eng8kfynfDjdYrtKD=kVJ=GJjuGobWg@mail.gmail.com>
 <20150527101333.1c2f6137@free-electrons.com>
 <CAJtzDg9TN7oH0owqeRu32p_=u=gtrjbwcAVjWabsO6=R+VT7tA@mail.gmail.com>
 <20150527103020.0aec65d2@free-electrons.com>
 <CAJtzDg8wS89HmskSNaB60NkOZgg-WQoYGmQtmJGVa3zJHDuBCA@mail.gmail.com>
 <20150527105234.76b1512a@free-electrons.com>
 <CAJtzDg85zxiYo7ntyHS_=pGorTyMjaR=zogDRdy_NaxWZKHikg@mail.gmail.com>
Message-ID: <20150527115112.44652358@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Laurent Joli,

On Wed, 27 May 2015 11:20:52 +0200, Laurent Joli wrote:
> Ok, I see now.
> 
> But When I boot with this rootfs ( ext2 ) on my board, I have :
> 
> buildroot login: root
> #
> #
> # lsmod
> Module                  Size  Used by    Not tainted
> # modprobe sky2
> modprobe: module sky2 not found in modules.dep

I think you should do some research about how to do the kernel
configuration.

If you enable a driver to be compiled statically, it is compiled
statically inside the kernel image, and there is no kernel module.

If you enable a driver to be compiled as a kernel module, then you get
a kernel module.

Since you selected your sky2 driver to be compiled statically, then
obviously you don't have a kernel module.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
