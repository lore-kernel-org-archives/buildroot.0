From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Nov 2011 17:51:22 +0000
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <CAEYzJUHexHVW+q95qUD3dVp5cTJp7Hu2yGShdkNr5w-rRfnoBw@mail.gmail.com>
References: <20111102160349.4afe5935@skate>
 <CAAXf6LUYoR7Hoasa0K-Rc3qJuATFn8mKWMbuKNtnU6XSSALpaQ@mail.gmail.com>
 <CAEYzJUHexHVW+q95qUD3dVp5cTJp7Hu2yGShdkNr5w-rRfnoBw@mail.gmail.com>
Message-ID: <201111181751.22578.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 18 November 2011 11:04:58 Bj?rn Forsman wrote:
> Thomas P. had some concerns about the patch not handling staging-dir
> and I never got around fixing that.
> 
> Should I resubmit even if the patch doesn't address the staging-dir issue?

 I consider clean-staging less important than clean-target.  Having things lingering around in staging is usually not a problem, except for the presence of some header or .pc of a library that is no longer present.  Normally buildroot should disable old that in the configure step, but of course you can never be sure.

 To implement a clean-staging, we'll probably need to use the copy-to-staging step of the external toolchains for all toolchains.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
