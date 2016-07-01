From: Carlos Santos <casantos@datacom.ind.br>
Date: Fri, 1 Jul 2016 07:43:00 -0300 (BRT)
Subject: [Buildroot] [PATCH v2 4/4] gtest,
 gmock: Move download link away from Google Code
In-Reply-To: <20160701094926.GA3659@free.fr>
References: <444859483-2268-1-git-send-email-alan@softiron.co.uk>
 <1456143807-3350-5-git-send-email-casantos@datacom.ind.br>
 <20160701094926.GA3659@free.fr>
Message-ID: <1537894575.7432607.1467369780476.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, alan at softiron.co.uk
> Sent: Friday, July 1, 2016 6:49:26 AM
> Subject: Re: [Buildroot] [PATCH v2 4/4] gtest, gmock: Move download link away from Google Code

> Carlos, Alan, All,
> 
> Coming back to this old patch of yours. Sorry for the delay...
> 
> On 2016-02-22 09:23 -0300, Carlos Santos spake thusly:
>> Google Code is being shut down. The google code site which hosts the
>> source .zip for gtest and gmock references github.com/google/googletest,
>> now.
>> 
>> Change the GTEST_SITE and GMOCK_SITE to this new github repo, fix the
>> version, fix the paths, and remove the custom extraction commands.
>> 
>> GitHub contains a combination of the former gtest and gmock repos, moved
>> to the sibling directories "googletest" and "googlemock", respectively.
>> 
>> The repo is a bit funky, however:
>> 
>> 1) The code underneath the "release-1.7.0" tag has gtest as in the
>>    google code repo, with minor changes (mostly support script and
>>    Microsoft C++ Builder project files, not relevant for buildroot
>>    purposes).
>> 
>> 2) There is no tag corresponding to gmock 1.7.0. We circumvent this by
>>    refering to the commit id corresponding to gmock 1.7.0.
>> 
>> 3) The "gtest" subdir was removed from the gmock code. We solve this by
>>    adding a patch to provide a copy of acx_pthread.m4 from gtest; then
>>    we configure refering to the gtest installed under $(STAGING_DIR).
>> 
>> These changes are required to ensure that gtest and gmock builds don't
>> fail if/when Google Code disappears. Forthcoming patches will replace
>> gtest and gmock by a "googletest" package and upgrade to the current
>> HEAD, which is laid out as described above.
> 
> As I understand it, gtest and gmock are being phased out as separate
> packages, and are to be replaced with the googletest package.
> 
> So why don't we directly add "googletest" and get rid of gtest and
> gmock, rather than fix them to eventually get rid of them?

Because we (DATACOM) have have a hundred packages in our BR2_EXTERNAL that depend on GMock and GTest as separate packages. It will take some time migrate them.

> I've marked this patch as rejected in our patchwork now, while waiting
> for the patches that add googletest and then removes gtest/gmock as
> separate packages.

OK, I will keep it as a local change while working on the new package.

> Regards,
> Yann E. MORIN.

Carlos Santos (Casantos)
DATACOM, P&D
