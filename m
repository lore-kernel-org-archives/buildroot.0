From: Wolfgang Grandegger <wg@grandegger.com>
Date: Mon, 3 Jul 2017 21:38:01 +0200
Subject: [Buildroot] [RFC PATCH v5 02/11] package/patchelf: add patch
 for rpath sanitation under a root directory
In-Reply-To: <e0092045-3a44-4b99-9220-5e8e05fef090@mind.be>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-3-git-send-email-wg@grandegger.com>
 <e0092045-3a44-4b99-9220-5e8e05fef090@mind.be>
Message-ID: <404844b9-a62b-c931-422b-31d08b474dcd@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

browsing your comments...

Am 01.07.2017 um 00:13 schrieb Arnout Vandecappelle:
>   Hi Wolfgang,
> 
> On 30-06-17 10:36, Wolfgang Grandegger wrote:
[... snip ...]
>> +-            if (!libFound)
>> ++            if (!libFoundInRPath(dirName, neededLibs))
>> +                 debug("removing directory '%s' from RPATH\n", dirName.c_str());
> 
>   For consistency, we should probably honour --no-standard-lib-dirs here as well.
> 

For "--shrink-rpath" it's difficult to decide what is a non standard 
library directory. A path ending with "/lib" or "/usr/lib"?

Wolfgang.
