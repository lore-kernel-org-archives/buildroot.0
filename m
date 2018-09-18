From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 18 Sep 2018 22:28:35 +0200
Subject: [Buildroot] [PATCH 1/2] at: change upstream site, bump version
In-Reply-To: <20180918111637.5274fe3f@windsurf>
References: <20180917211219.17868-1-giulio.benetti@micronovasrl.com>
 <20180917211219.17868-2-giulio.benetti@micronovasrl.com>
 <20180918095726.50623f29@windsurf>
 <34001101-5184-40d5-6234-ff89929b6c58@micronovasrl.com>
 <20180918111637.5274fe3f@windsurf>
Message-ID: <9b4bec27-11b6-9d46-65f4-d5b52f532f93@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Il 18/09/2018 11:16, Thomas Petazzoni ha scritto:
> Hello,
> 
> On Tue, 18 Sep 2018 10:01:40 +0200, Giulio Benetti wrote:
> 
>> By the way, testing it on qemu and also a colleague found that on arm
>> board, atd needs .SEQ file before starting.
>> Do I have to add this to package?
> 
> What is this .SEQ file ?

/var/spool/cron/atjobs/.SEQ is a necessary file for atd which keeps
status of scheduled jobs.
If atd doesn't find that file fails to run instead of creating it 
empty(this is the solution to make it work).
So better add:
touch /var/spool/cron/atjobs/.SEQ on target_dir
to the package.

So I've answered myself :)

-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
