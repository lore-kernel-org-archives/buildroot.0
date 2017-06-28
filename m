From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Jun 2017 08:40:58 +0200
Subject: [Buildroot] [RFC PATCH v3 00/10] Make the SDK relocatable
In-Reply-To: <311f5c7c-ad46-e1f1-4570-dfffb5605292@mind.be> (Arnout
 Vandecappelle's message of "Wed, 28 Jun 2017 00:47:33 +0200")
References: <1490255693-9134-1-git-send-email-wg@grandegger.com>
 <6799ad7b-a16e-d89e-eb73-d7d91880d341@mind.be>
 <d993626e-11b0-ab21-f022-d64f6a7340b6@grandegger.com>
 <8b074253-3002-1db9-d902-a73bb47e734b@grandegger.com>
 <dec2b16c-50f5-15d2-2082-c31ca82170ec@mind.be>
 <6a236664-6cd5-c2e6-e4bc-ee5f7b6b21a1@grandegger.com>
 <311f5c7c-ad46-e1f1-4570-dfffb5605292@mind.be>
Message-ID: <87y3scehs5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> So if you change sudo's RPATH to $ORIGIN/../libexec/sudo it doesn't find
 >>> libsudo_util.so.0 at runtime? Or how does it break?
 >> 
 >> Yep, that's the problem. I think it's because of "For security, the
 >> dynamic linker does not allow use of $ORIGIN substitution sequences for
 >> set-user and set-group ID programs..." from
 >> 
 >> http://seclists.org/fulldisclosure/2010/Oct/257

Makes sense, you don't want your setuid binaries to load random
libraries.

 >  Ah I see. So in target we should always use absolute paths. Makes sense.

Indeed.

 >  Next week in the Buildroot Summer Camp I'm going to spend time on this series,
 > so there should be progress...

Indeed. I was also planning on spending some time on it.

-- 
Bye, Peter Korsgaard
