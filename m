From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 16:49:41 +0200
Subject: [Buildroot] [PATCH v6 10/10] package/qt5base: provide "qt.conf"
 to make "qmake" relocatable
In-Reply-To: <e0641e1d-7b26-954e-06b7-6655645ed099@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-11-git-send-email-wg@grandegger.com>
 <ccd502d6-648b-7a9d-1d64-6e14eb90196f@mind.be>
 <a3612c93-7e2a-f2e0-0fbd-9d93bd4e759a@grandegger.com>
 <57657dbc-eca2-a352-ae7c-902a01c9ce73@grandegger.com>
 <51297962-b3bc-bd68-8dee-3a1ad8ca92ae@grandegger.com>
 <20170705161317.205dc3ae@windsurf>
 <e0641e1d-7b26-954e-06b7-6655645ed099@grandegger.com>
Message-ID: <45570cad-16ce-7f42-3f13-a7712c2b95e4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 16:33, Wolfgang Grandegger wrote:
> 
> 
> Am 05.07.2017 um 16:13 schrieb Thomas Petazzoni:
>> Hello,
>>
>> On Wed, 5 Jul 2017 15:48:22 +0200, Wolfgang Grandegger wrote:
>>
>>> What about making the relocation stuff configurable as shown in the patch below.
>>> The advantage is that it could also control the generation of the "qt.conf",
>>> for example.
>>
>> We don't want to make it configurable, through a Config.in option.
>> However, we would like to have a separate make target that prepares the
>> SDK, creates the tarball, etc.
>>
>> Basically, a normal "make" would not run all the rpath sanitization
>> logic, absolute path replacement, etc. There should be a separate "make
>> sdk" target that does this.
> 
> Yes I understand, but how do you want to handle static things like the creation
> of "qt.conf" required for the relocatable SDK?

 It should still work if you have the relocatable SDK option selected. So
basically we want the option to always be selected and things to still work.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
