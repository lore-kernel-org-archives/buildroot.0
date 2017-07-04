From: Wolfgang Grandegger <wg@grandegger.com>
Date: Tue, 4 Jul 2017 09:17:19 +0200
Subject: [Buildroot] [RFC PATCH v5 00/11] Make the SDK relocatable
In-Reply-To: <d20f9390-20ae-7021-1005-4afe8daeea7f@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <d20f9390-20ae-7021-1005-4afe8daeea7f@mind.be>
Message-ID: <32b47557-046c-424f-9d70-6b67a741cfc7@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Am 04.07.2017 um 00:50 schrieb Arnout Vandecappelle:
>   Hi Wolfgang,
> 
>   Again thank you very much for sustaining the work on this series!
> 
> On 30-06-17 10:36, Wolfgang Grandegger wrote:
>> Hello,
>>
>> this is v5 of my patch series to make the buildroot SDK (HOST_DIR)
>> relocatable. It sanitizes the RPATH of all ELF files in the "target",
>> "staging" and "host" tree using "patchelf --make-rpath-relative". I
>> have started the mainlining process to implement "--make-rpath-relative"
>> using GitHub pull request [1]... till now, no answer!
>>
>> In contrast to v4, this series now does RPATH sanitation per package
>> after package installation into the host, staging or target tree
>> using GLOBAL_INSTRUMENTATION_HOOKS, similar to "check-bin-arch" or
>> "check-host-rpath". This is a first hack to demonstrate feasibility.
>> The scripts in "pkg-generic.mk" needs some more polish to be more
>> efficient and elegant. See also "Changes since v4" below.
> 
>   Samuel and I reviewed the entire series now. It's getting closer but I expect a
> v7 will still be needed even after you send v6. I've marked these as Changes
> Requested in patchwork.

Great. Just wait for my next series as it already contains a lot of 
changes (mainly to pkg-generic.mk and fix-rpath).

>> Furthermore this patch creates the script "relocate-sdk.sh" in the top
>> directory of the "host" tree allowing to relocate the SDK after it has
>> been moved to a new location. It replaces the old path with the new
>> one in all text files identified by "file --mime-type". The location
>> is stored in "usr/share/buildroot/sdk-location".
> 
>   These final patches are pretty much ready, just minor things. Peter will
> probably fix them up tomorrow and commit directly. So if you start working on
> those, please give us a ping first (preferably on IRC - Peter is Jacmet).
> 
> 
>> Unfortunately, "qmake" uses hard-coded pathes compiled into the QT5
>> libraries. To overcome this problem, "qt5pase" now creates "qt.conf".
> 
>   There will be many more packages that need this kind of treatment, I expect.
> Things will hopefully improve over time.

Yes, that's also my feeling.

Wolfgang.
