From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 18:07:18 +0200
Subject: [Buildroot] Cannot build Custom Kernel Module
In-Reply-To: <CAN34fozx7-myS-6xvHiwkZdovdfCO_vkjDJU8V427yEk5-ckAA@mail.gmail.com>
References: <CAN34foz3HvhgeBsPKEc6vjsrzUWK-gsHoAVsvPSR7Def1gMKyA@mail.gmail.com>
 <570D638B.2040500@mind.be>
 <CAN34foxCgoP_i21MRzXiF2DWuT+R9XL9LvKR+NpDYjh1Mga7xw@mail.gmail.com>
 <570E67C7.5020209@mind.be>
 <CAN34fozx7-myS-6xvHiwkZdovdfCO_vkjDJU8V427yEk5-ckAA@mail.gmail.com>
Message-ID: <570E6EB6.8020003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/13/16 18:00, Stephen Beckwith wrote:
[snip]
>   -  The build root version I have is 2015.08.01 - this supports a 4.1.4
> kernel.  Since 4.1.x is an LTS kernel, is there a way to tell/configure
> Buildroot to fetch a patch for the latest . release (currently 4.1.21)???
> Meaning, a patch from 4.1.4 -> 4.1.21?   I've done something like this in the
> past, wasn't easy.

  Just set BR2_LINUX_KERNEL_CUSTOM_VERSION and fill in the version.

  Or, if you're using BR2_LINUX_KERNEL_SAME_AS_HEADERS, choose 
BR2_KERNEL_HEADERS_VERSION and fill in the version.


  This even works for versions > 4.1 if you want. Just claim that it's a 4.1 
version.

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
