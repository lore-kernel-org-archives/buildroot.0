From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 5 Jul 2017 17:10:11 +0200
Subject: [Buildroot] [PATCH v6 10/10] package/qt5base: provide "qt.conf"
 to make "qmake" relocatable
In-Reply-To: <20170705164805.226e3a48@windsurf>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-11-git-send-email-wg@grandegger.com>
 <ccd502d6-648b-7a9d-1d64-6e14eb90196f@mind.be>
 <a3612c93-7e2a-f2e0-0fbd-9d93bd4e759a@grandegger.com>
 <57657dbc-eca2-a352-ae7c-902a01c9ce73@grandegger.com>
 <51297962-b3bc-bd68-8dee-3a1ad8ca92ae@grandegger.com>
 <20170705161317.205dc3ae@windsurf>
 <e0641e1d-7b26-954e-06b7-6655645ed099@grandegger.com>
 <20170705164805.226e3a48@windsurf>
Message-ID: <3d82efb6-6eb7-d756-7570-26d57499487b@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Am 05.07.2017 um 16:48 schrieb Thomas Petazzoni:
> Hello,
> 
> On Wed, 5 Jul 2017 16:33:35 +0200, Wolfgang Grandegger wrote:
> 
>>> We don't want to make it configurable, through a Config.in option.
>>> However, we would like to have a separate make target that prepares the
>>> SDK, creates the tarball, etc.
>>>
>>> Basically, a normal "make" would not run all the rpath sanitization
>>> logic, absolute path replacement, etc. There should be a separate "make
>>> sdk" target that does this.
>>
>> Yes I understand, but how do you want to handle static things like the
>> creation of "qt.conf" required for the relocatable SDK?
> 
> In order to make sure that the SDK situation is as close to a normal
> Buildroot usage, I think the qt.conf file should always be created and
> used by qmake. So basically, the Qt package in Buildroot should create
> and install this file.
> 
> Am I missing something here?

It works here (with my usecase)! But the qmake internals are not really 
transparent (not documented) and may break if new path variables are 
added etc.(by Qt). But well, then we just need to fix it. Let see how 
good qt.conf works...

Wolfgang.
