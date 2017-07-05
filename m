From: Wolfgang Grandegger <wg@grandegger.com>
Date: Wed, 5 Jul 2017 12:28:14 +0200
Subject: [Buildroot] [PATCH v6 10/10] package/qt5base: provide "qt.conf"
 to make "qmake" relocatable
In-Reply-To: <a3612c93-7e2a-f2e0-0fbd-9d93bd4e759a@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-11-git-send-email-wg@grandegger.com>
 <ccd502d6-648b-7a9d-1d64-6e14eb90196f@mind.be>
 <a3612c93-7e2a-f2e0-0fbd-9d93bd4e759a@grandegger.com>
Message-ID: <57657dbc-eca2-a352-ae7c-902a01c9ce73@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 05.07.2017 um 11:30 schrieb Wolfgang Grandegger:
> Hello Arnout,
> 
> Am 05.07.2017 um 10:59 schrieb Arnout Vandecappelle:
>>   Hi Wolfgang,
>>
>> On 04-07-17 18:22, Wolfgang Grandegger wrote:
>>> The file "qt.conf" can be used to override the hard-coded paths that are
>>> compiled into the Qt library. We need it to make "qmake" relocatable.
>>
>>   All qt5 packages are failing because of this, e.g.
>> http://autobuild.buildroot.net/results/33e/33eb7b7ef7d232bed2432d1d44fd80a4fc8c4e2d 
>>
>>
>> qt5serialport: installs files in
>> /accts/mlweber1/instance-2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot//accts/mlweber1/instance-2/output 
>>
>>
>>
>>   Can you have a look?
> 
> I know the problem! The patched used an old version (from an old series) 
> of "qt.conf.in"..., sorry!

The patch is reverted now. So just for the records, the patch below
fixes the problem. I'm going to provide a proper patch with my next
series. This also shows, that if "qt.conf" is in place, it's active and
will always overwrite the pathes compiled into qmake... which will break
the idea of "make sdk" somehow.
