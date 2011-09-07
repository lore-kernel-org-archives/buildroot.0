From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Sep 2011 12:44:52 +0300
Subject: [Buildroot] Question related to a support to a new architecture
In-Reply-To: <CAOPDcRwGkJRgoeCjZ32ob2tKADzfmKGbQdUMfupRLns5JwGw7g@mail.gmail.com>
References: <CAOPDcRwGkJRgoeCjZ32ob2tKADzfmKGbQdUMfupRLns5JwGw7g@mail.gmail.com>
Message-ID: <20110907094451.GD16073@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi stl,

On Wed, Sep 07, 2011 at 11:34:24AM +0200, stl wrote:
> I am porting Linux for a new architecture, and I need to build my Linux
> system.
> 
> Of course this architecture is not supported by Buildroot, so I am wondering 
> if it is possible to do the port by myself?

Do you have binutils and gcc support for this architecture? If not, Buildroot 
support is the least of your problems.

> If so, what should be the quantity of work to do that?

Support for a whole new architecture requires ports for the following 
components:

1. binutils
2. gcc
3. A bootloader (like u-boot)
4. The Linux kernel
5. A C library (glibc or uClibc, etc.)

I'd estimate the work involved in a few person years (not including testing).

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
