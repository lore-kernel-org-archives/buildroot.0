From: Jonathan dumaresq <jdumaresq@cimeq.qc.ca>
Date: Mon, 9 Nov 2009 16:46:37 -0500
Subject: [Buildroot] for target toolchain to be compiled
In-Reply-To: <87d43rs7e3.fsf@macbook.be.48ers.dk>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAEZ6jQmWCPNPhTWJOiBE+SEBAAAAAA==@cimeq.qc.ca><87iqdjs97e.fsf@macbook.be.48ers.dk><!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAB/2nbG5LTJMskyNbh63LRwBAAAAAA==@cimeq.qc.ca>
	<87d43rs7e3.fsf@macbook.be.48ers.dk>
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAAMLYb/qs2/pPndELxkaSBIYBAAAAAA==@cimeq.qc.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

-----Message d'origine-----
De?: Peter Korsgaard [mailto:jacmet at gmail.com] De la part de Peter Korsgaard
Envoy??: 9 novembre 2009 16:42
??: Jonathan dumaresq
Cc?: 'Peter Korsgaard'; buildroot at busybox.net
Objet?: Re: [Buildroot] for target toolchain to be compiled

>>>>> "Jonathan" == Jonathan dumaresq <jdumaresq@cimeq.qc.ca> writes:

 Jonathan> Hi Peter,
 Jonathan> See the log file attached

 Jonathan>   HOSTCC extra/scripts/unifdef
 Jonathan> extra/scripts/unifdef.c:209: error: conflicting types for
'getline'
 Jonathan> /usr/include/stdio.h:651: note: previous declaration of 'getline'
was here

Ok, so that's the problem with unifdef defining a getline function which
conflicts with a function in the C library in never versions of glibc
with the same name.

You need to ensure that the
toolchain/uClibc/uClibc-0.9.30.1-unifdef-getline.patch gets applied to
your toolchain build - presumably by moving it to
toolchain/uClibc/ext_source/Atmel/avr32/0.9.30-avr32-2.1.5 and renaming
it to uClibc-0.9.30-avr32-2.1.5-unifdef-getline.patch

Let me know if that works for you, then I'll fix it in git.
-- 
Bye, Peter Korsgaard

You rock... That fixed it. 

Jonathan
