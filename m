From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 17 May 2017 22:28:43 -0500
Subject: [Buildroot] [PATCH 1/1] package/avrdude: fix gpio definition,
 add kconfig option
In-Reply-To: <20170518032306.mbvzslnrmtrh45it@tarshish>
References: <1495061934-57465-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20170518032306.mbvzslnrmtrh45it@tarshish>
Message-ID: <CANQCQpZr+7AfiP9DeLhHDENtU8qNvedGoKb+rO3dzOFYsg4B_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On May 17, 2017 10:23 PM, "Baruch Siach" <baruch@tkos.co.il> wrote:

Hi Matt, Sam,

On Wed, May 17, 2017 at 05:58:54PM -0500, Matt Weber wrote:
> +if BR2_PACKAGE_AVRDUDE
> +
> +config BR2_PACKAGE_AVRDUDE_LINUXGPIO
> +     bool "linux gpio"
> +     depends on BR2_PACKAGE_AVRDUDE
> +     help
> +       Enables the tool to use the Linux Sysfs based GPIO framework for
GPIO
> +       access by configuring AVRDude with '--enable-linuxgpio'.
> +endif

How big is the size impact of enabling this option? If it is relatively
small,
enabling gpio support unconditionally would be better, I think.


Agreed, the only reason we made it optional was compatibility, as currently
it's disabled.



baruch

--
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170517/a0f23692/attachment.html>
