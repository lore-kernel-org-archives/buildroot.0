From: Mirza Krak <mirza.krak@northern.tech>
Date: Fri, 17 Aug 2018 08:53:28 +0200
Subject: [Buildroot] [PATCH 1/8] package/mender: update legal info
In-Reply-To: <876009odp0.fsf@tkos.co.il>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-2-mirza.krak@northern.tech>
 <0d11b4c6-40ac-5a3a-69d4-a1dda529d43f@mind.be>
 <CADHdJwB78Mo5rtpQk0e6OhkAzdcGPvkz_iRu4AcWcSwB68z2Mw@mail.gmail.com>
 <1377b705-71cf-3649-5bf1-f31a307d74fd@mind.be>
 <CADHdJwBjz6OCX4wBz_cTquz2+QbD_48NDEBSSrjAbkRBDgqiGQ@mail.gmail.com>
 <876009odp0.fsf@tkos.co.il>
Message-ID: <CADHdJwBSL_E56qGHchkeUW8cJTe2ZT1yf=vwGaEGu-p+mknsJQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 17, 2018 at 5:48 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Mirza,
>

< snip >

>>
>> Hmm, though I having some issues with trying to accommodate this.
>>
>> Adding the following line to mender.hash:
>>
>>     # BSD 2 Clause license.
>> sha256 8d427fd87bc9579ea368fde3d49f9ca22eac857f91a9dec7e3004bdfab7dee86
>>  vendor/github.com/pkg/errors/LICENSE
>>
>> Does not do anything, when I run:
>>
>>     $ make mender-legal-info
>>     >>> mender 1.4.0 Collecting legal info
>>     LICENSE: OK (sha256:
>> ceb1b36ff073bd13d9806d4615b931707768ca9023805620acc32dd1cfc2f680)
>>     LIC_FILES_CHKSUM.sha256: OK (sha256:
>> 54d6f54a2815cc2e3cef4f7dde5a3aae20f09b2cde394d8d3f1dce5d8a79d738)
>>
>> Inspecting other *.hash files in Buildroot, no one seems to reference
>> files that are outside of the "root source". Or should I specify the
>> path differently?
>
> There are a number of packages with license files in subdirectories. For
> example:
>
> make alsa-lib-legal-info
> ...
>>>> alsa-lib 1.1.6 Collecting legal info
> COPYING: OK (sha256: 32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b)
> aserver/COPYING: OK (sha256: bfe16cf823bcff261fc6a062c07ee96660e3c39678f42f39a788a68dbc234ced)

Of course.

I missed adding the files to LICENSE_FILES. Doh!

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
