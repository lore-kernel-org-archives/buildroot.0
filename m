From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Fri, 17 May 2019 20:09:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: add
 BR2_PACKAGE_HAS_LIBEGL_WAYLAND dependency
In-Reply-To: <20190517090800.1ce26f4f@windsurf>
References: <20190516201220.24893-1-fontaine.fabrice@gmail.com>
 <20190517002828.GB29253@momiji> <20190517090800.1ce26f4f@windsurf>
Message-ID: <d8ba40cb-dbcf-0d3e-5a47-16dad7fff660@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adrian, All,

Il 17/05/2019 09:08, Thomas Petazzoni ha scritto:
> Hello Adrian,
> 
> On Fri, 17 May 2019 00:28:28 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
>> This is not correct. The short version of the story is tat WPE WebKit
>> itself does not require Wayland, only wpebackend-fdo uses Wayland.
> 
> That does not matter.
> 
> If A selects B, and B depends on C, then A *must* replicate the
> "depends on C". That's due to how Kconfig work, and it's totally
> unrelated to the fact that A doesn't use C directly in practice.
> 
> If you don't replicate this "depends on", then Kconfig allows you to
> enable "A" even if the dependencies for "B" are not satisfied, causing
> the build failure that Fabrice is fixing.
> 
> So, Fabrice patch is correct.

Thomas and Fabrice are correct because wpewebkit in its Config.in:
"select BR2_PACKAGE_WPEBACKEND_FDO"
Probably that's the problem, wpewebkit should not select that specific 
Backend, but should let to the user the choice about which Backend to 
use or even none.
This is why I've got confused too.

So Fabrice's patch fixes build failure, but probably we need another 
patch to add the Backend choice.

What do you think?

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
