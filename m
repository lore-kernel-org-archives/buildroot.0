From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 23:18:53 +0100
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: enable multithreaded xz
 compression
In-Reply-To: <87a7jln4bt.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 27 Jan 2019 23:06:14 +0100")
References: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
 <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
 <871s55ykoj.fsf@dell.be.48ers.dk> <20190126150622.23c7375e@windsurf>
 <87a7jln4bt.fsf@dell.be.48ers.dk>
Message-ID: <875zu9n3qq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 >> Does it matter than the output of -T 0 and -T 1 are identical ?

 > It would cause an extra change in output between buildroot versions
 > using -T 0 and ones using -T 1 - But OK, probably that isn't really
 > important given all the other changes.

 > What I really meant was if the -T 1 option affected the output format,
 > and if so, if the difference involved any tradeoff (E.G. perhaps -T 1
 > compresses slightly worse than -T 0) and if repeated runs with -T 1
 > would generate the same output (on same machine or on another machine
 > with different number of threads).

Sorry, got -T 1 and -T 0 mixed up, I meant -T 0 here.

 >> What matters for BR2_REPRODUCIBLE=y is if the same input, with -T 0,
 >> always provide the exact identical output.

 > With the new patch that only enables -T 1 for !reproducible builds,
 > that is correct.

The assumption is that this is not true, especially between systems with
different number of CPUs.

-- 
Bye, Peter Korsgaard
