From: Wolfgang Grandegger <wg@grandegger.com>
Date: Sat, 1 Jul 2017 21:43:27 +0200
Subject: [Buildroot] [RFC PATCH v5 04/11] pkg-generic: create a list af
 installed files per step and package
In-Reply-To: <CAHXCMM+p=V+4J3ZBZwo7D6cB=x8juWOR2yGQnP=kJc=t39QhnA@mail.gmail.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-5-git-send-email-wg@grandegger.com>
 <CAHXCMM+p=V+4J3ZBZwo7D6cB=x8juWOR2yGQnP=kJc=t39QhnA@mail.gmail.com>
Message-ID: <535b8f6b-e2c5-a90a-6373-a5dfc31a8699@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Am 01.07.2017 um 16:00 schrieb Samuel Martin:
> Hi Wolfgang,
> 
> In the commit title: s/af/of/
> 
> On Fri, Jun 30, 2017 at 10:37 AM, Wolfgang Grandegger <wg@grandegger.com> wrote:
>> The GLOBAL_INSTRUMENTATION_HOOKS "step_pkg_size*" are extended to create
>> a file with the list of all installed files per step and package. The
>> file name is "<package-build-dir>/.br_<host|staging|target>_filelist".
>> This file could be used by other hooks to scan the installed files,
>> e.g. to check the bin arch, the host rpath or for rpath sanitation.
>>
>> For a quick hack, the "packages-file-list.txt" is created as before.
> 
> Nit: you could add few words why you needed this here, but I figured
> out while reviewing the rest of the series ;-)

For the moment it's just a quick hack. Maybe the file with the list of 
the installed packages could be used by other hooks as well 
(check-bin-arch, check-host-rpath, etc.

Wolfgang.
