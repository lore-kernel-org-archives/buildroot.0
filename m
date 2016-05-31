From: Carlos Santos <casantos@datacom.ind.br>
Date: Tue, 31 May 2016 16:40:16 -0300 (BRT)
Subject: [Buildroot] [PATCH v3] uboot-tools: fix FIT support and make it
 optional
In-Reply-To: <20160531210122.39a50d97@free-electrons.com>
References: <1462535953-4427-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
 <1462736800-9552-2-git-send-email-casantos@datacom.ind.br>
 <20160528150755.78888529@free-electrons.com>
 <468666808.273843.1464715989675.JavaMail.zimbra@datacom.ind.br>
 <20160531210122.39a50d97@free-electrons.com>
Message-ID: <1106718859.329816.1464723616437.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "yann morin 1998" <yann.morin.1998@gmail.com>
> Sent: Tuesday, May 31, 2016 4:01:22 PM
> Subject: Re: [Buildroot] [PATCH v3] uboot-tools: fix FIT support and make it optional

> Hello,
> 
> On Tue, 31 May 2016 14:33:09 -0300 (BRT), Carlos Santos wrote:
> 
>> > 3/ Improving FIT support for the host variant
>> > 
>> > 4/ Improving FIT support for the target variant
>> 
>> Tasks 3 and 4 can not be separated because both depend on the new patch that
>> makes FIT support really optional.
> 
> Of course they can be separated. Just include the patch that makes FIT
> support really optional into patch (3) from my list.

Step 3 would make the ...MKIMAGE_FIT_SIGNATURE_SUPPORT option useless. Once the patch is applied, FIT support depends on passing CONFIG_FIT=y in the make command line, which would be made done only in step 4.

>> OK, I will make these changes. I'd like to emphasize, however, that
>> currently uboot-tools is broken. FIT support is always compiled, so
>> run-time dependence on "dtc" persists but dtc is not selected in
>> Config.in{.host,}. This is the problem that my initial patch intended
>> to fix.
> 
> Sure, that's why I reviewed your patch, and suggested a few
> improvements that should be made to allow us to apply the patch. Once
> the improvements are made, I believe we should be able to apply it
> pretty quickly.

Carlos Santos (Casantos)
DATACOM, P&D
