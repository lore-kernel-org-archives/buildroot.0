From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 12:08:48 +0200
Subject: [Buildroot] [PATCH 1/2] package/ca-certificates: don't hash
 certificates.crt
In-Reply-To: <CAFGQKxf5Nn5AKMJ6-n8Ue_qvoE-O9x09yoC9T1nbz5OOp5781g@mail.gmail.com>
 (Martin Bark's message of "Tue, 29 May 2018 10:48:48 +0100")
References: <20180506161944.7451-1-martin@barkynet.com>
 <87a7sjuf97.fsf@dell.be.48ers.dk>
 <CAFGQKxf5Nn5AKMJ6-n8Ue_qvoE-O9x09yoC9T1nbz5OOp5781g@mail.gmail.com>
Message-ID: <87sh6a7ozz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > Peter,
 > On 29 May 2018 at 07:50, Peter Korsgaard <peter@korsgaard.com> wrote:

 >> >>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:
 >> 
 >> > Copy certificates.crt to /etc/ssl/certs after we run c_rehash to
 >> > prevent it getting hashed by mistake.
 >> 
 >> What is the effect of running c_rehash on it? Just an extra symlink or
 >> any functional difference?
 >> 

 > c_rehash hashes certificates.crt by mistake and that symlink clashes with
 > one of the CA certificates.  The end result is one of the hashes
 > incorrectly points to certificates.crt instead of the CA certificate.  I
 > noticed this during testing because i checked /etc/ssl/certs was the same
 > as under ubuntu.

Ok, can you rework the commit message with these details (and perhaps
the for loop change) and resubmit? Thanks!

-- 
Bye, Peter Korsgaard
