From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Mon, 11 Jan 2016 08:32:26 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for
 lxc-checkconfig runtime
In-Reply-To: <20160110170922.GH3460@free.fr>
References: <1442761327-18830-1-git-send-email-yba@tkos.co.il>
 <20150920190622.3f7278c3@free-electrons.com>
 <alpine.DEB.2.02.1509202012390.13941@orcam81.orcam.lan>
 <20150920230136.513b491c@free-electrons.com> <20160110170922.GH3460@free.fr>
Message-ID: <alpine.DEB.2.11.1601110802480.13943@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,
My current use case for lxc in Buildroot is for mobile SoC's such as the 
Qualcomm Snapdragon 805 and 810 that have IP blocks such as DSP's, VPU's 
and GPU's for which Qualcomm only releases Android drivers and libraries. 
In order to use these IP blocks, I run Android in an lxc and pass CNN 
kernels from Linux to adsprpcd running in Android that passes the CNN 
kernels through the Linux kernel to the Hexagon DSP. Admittedly this adds 
new meaning to the term "Convoluted Neural Networks" but it provides an 
interim solution to the application developers until we can reverse 
engineer Qualcomm's FastRPC interface.

I will re-spin the patch but before that I have yp-tools, ypbind-mt, 
sphinxbase and pocketsphinx to finish.
Thanks,

  - yba


On Sun, 10 Jan 2016, Yann E. MORIN wrote:

> Date: Sun, 10 Jan 2016 18:09:23 +0100
> From: Yann E. MORIN <yann.morin.1998@free.fr>
> To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Jonathan Ben Avraham <yba@tkos.co.il>, buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH 1/1] lxc needs gzip scripts for
>     lxc-checkconfig runtime
> 
> Thomas, Jonathan, All,
>
> On 2015-09-20 23:01 +0200, Thomas Petazzoni spake thusly:
>> On Sun, 20 Sep 2015 20:15:02 +0300 (IDT), Jonathan Ben Avraham wrote:
>>
>>> I wondered whether to send a patch for each 'select' individually or to
>>> wait until I complete my testing and submit a single patch with all of the
>>> lxc selects. What do you prefer?
>>
>> Both solutions are fine with me. You can send patches as you
>> progressively discover the issues, or send a single patch fixing all
>> problems at once.
>>
>> I'm just wondering if we want to make all these dependencies actually
>> mandatory or not. It seems some of these dependencies are only used for
>> one specific tool in LXC. If the tool is not crucial in LXC usage,
>> maybe we should make it optional via a sub-option? I'm not sure here,
>> just thinking out loud.
>
> Well, lxc is already in the 'server-class' software, probably to run a
> bunch of containers, themselves in the 'bloatware-class'.
>
> So, the overhead of having gzip is probably insignifiant in the face of
> the size of the rest of the system.
>
> So, I'm OK with selecting gzip unconditionally.
>
> However, I would not want to force-select BB_SHOW_OTHERS, even though we
> already do it in three locations. Well, damn be it, just select both.
>
> Jonathan, care to fix and respin, please?
>
> Regards,
> Yann E. MORIN.
>
>

-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm
