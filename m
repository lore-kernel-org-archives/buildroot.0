From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Jun 2018 21:59:12 +0200
Subject: [Buildroot] [PATCH 1/1] mosquitto: bump to version 1.5
In-Reply-To: <CAPi7W82Lz4-TPxS24=M7fpGBLEAJ5jWmbHpSrNeVWEmAfCqi4A@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 12 Jun 2018 19:59:34 +0200")
References: <20180610134244.5369-1-fontaine.fabrice@gmail.com>
 <87r2ldaxee.fsf@dell.be.48ers.dk>
 <CAPi7W82Lz4-TPxS24=M7fpGBLEAJ5jWmbHpSrNeVWEmAfCqi4A@mail.gmail.com>
Message-ID: <87o9gf6ajz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> How much have you tested this?

 > I have tested it and it seems to work, mosquitto was starting, basic
 > publish / subscribe was ok.

Ok.


 >> I haven't followed the discussion on
 >> mosquitto-dev in a lot of details, but apparently there is an unresolved
 >> crash issue:
 >> 
 >> https://github.com/eclipse/mosquitto/issues/505

 > This issue is indeed still present in v1.5.
 > The following steps leads to a crash on the broker:

 >    - connect
 >    - subscribe to topic/a
 >    - subscribe to topic/b
 >    - unsubscribe from topic/a
 >    - disconnect

 > PR #531 fixes the issue but was not merged perhaps because there is a
 > conflict in src/database.c that was not fixed. I will send a v2 of my patch
 > to fix this issue.

Ok, thanks!

-- 
Bye, Peter Korsgaard
