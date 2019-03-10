From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 10 Mar 2019 15:57:17 +0100
Subject: [Buildroot] [PATCH 0/2] ppsh compatible Qt5 configuration
In-Reply-To: <20190309152204.38e20094@windsurf>
References: <20190309141022.13140-1-anaumann@ultratronik.de>
 <20190309152204.38e20094@windsurf>
Message-ID: <4dfd5a58-e0dd-0da1-4bf4-985ca7ee3661@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/03/2019 15:22, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Sat,  9 Mar 2019 15:10:20 +0100
> Andreas Naumann <anaumann@ultratronik.de> wrote:
> 
>> you were asking for ideas on "Making the Qt5 packaging compatible with
>> per-package folder". Lately I had some time to look into it and came up
>> with the following patches. Basically they use a custom qt.conf to manipulate
>> qmakes builtin pathes. Details are in the commit-messages.
>>
>> I did a compile test with almost all qt5 modules available, as well as other
>> buildroot provided qt5 applications. At the moment I dont have equipment for
>> runtime tests. As far as I could see the install procedure now works as
>> expected, no more failures.
>> Unfortunately webengine and webkit-example failed sometime during the build
>> but it seems that these were unrelated issues.
> 
> Thanks a lot for looking into this!
> 
> However, there is one thing that this doesn't seem to address: the
> installation part.
> 
> Currently, the staging installation is just:
> 
> 	make install
> 
> with no DESTDIR/INSTALL_ROOT, and therefore for the target
> installation, we have to manually install libraries, QML files and
> other stuff, which is really annoying to maintain. Ideally, we would
> like Qt5 to behave like most other packages, and do:
> 
> 	make INSTALL_ROOT=$(STAGING_DIR) install
> 
> for the staging installation, and:
> 
> 	make INSTALL_ROOT=$(TARGET_DIR) install
> 
> for the target installation. This change is not strictly needed for
> per-package host/target directories, but I really would like to take
> the opportunity of changing all this Qt5 logic to also address this
> related problem.

 And maybe also take the opportunity to add qmake infra. That would make changes
like this patch a lot easier.

 Regards,
 Arnout


> 
> I had prepared something like this:
> https://github.com/tpetazzoni/buildroot/commit/05e776abf531319a749f5a7d65f265979ea6c4ab,
> but I don't remember if it was working completely or not.
> 
> Thanks,
> 
> Thomas
> 
