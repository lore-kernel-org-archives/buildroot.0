From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Dec 2013 16:43:37 +0100
Subject: [Buildroot] [PATCH v4 2/2] manual: update for multiple global
 patch dirs
In-Reply-To: <20131217160207.3ddd3a69@skate>
References: <1387270827-4379-1-git-send-email-rjbarnet@rockwellcollins.com>	<1387270827-4379-2-git-send-email-rjbarnet@rockwellcollins.com>	<CAAXf6LVu=ZUYZ-O-+WcCcnY2sCs8Nn-OiEwRwNkrjyqwhakE=Q@mail.gmail.com>	<52B04F5E.1010602@mind.be>	<OF15352E49.1C4D9698-ON86257C44.0049F2E1-86257C44.004F26CE@rockwellcollins.com>
 <20131217160207.3ddd3a69@skate>
Message-ID: <52B07129.8000900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/13 16:02, Thomas Petazzoni wrote:
> Dear Ryan Barnett,
>
> On Tue, 17 Dec 2013 08:24:47 -0600, Ryan Barnett wrote:
>
>> I was going to follow-up this patch with another series that removes
>> the options PATCH_DIR options for individual packages besides the
>> kernel. When I do that, I was planning on cleaning up the
>> documentation to avoid this duplication. It was easier for right now,
>> to duplicate the section Arnout requested rather than to try to
>> figure out the best way possible for avoiding duplication.
>
> Hmm, for which packages do you want to remove the PATCH_DIR options? If
> they exist for some packages, it's quite hard to remove them, as you're
> breaking compatibility. Not sure what should be our backward
> compatibility guarantee in this kind of cases.
>
> And why "besides the kernel" ?

  Read the rest of the thread :-)

  In summary:

- For U-Boot, Barebox, maybe others there are config options which 
provide exactly the same functionality as GLOBAL_PATCH_DIR. So these 
options can be removed IMHO (with Config.in.legacy pointing to the 
GLOBAL_PATCH_DIR option).

- For the kernel, there is an option that provides a slightly different 
functionality: it allows to download patches in addition to using patches 
on the local system.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
