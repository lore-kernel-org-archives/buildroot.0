From: Brendan Heading <brendanheading@gmail.com>
Date: Sat, 3 Oct 2015 21:20:39 +0100
Subject: [Buildroot] [PATCH RFC v1 1/1] gcc: improve checking of stack
 smashing support with uclibc
In-Reply-To: <56100FFC.6020805@mind.be>
References: <1442685931-20556-1-git-send-email-brendanheading@gmail.com>
 <56007E78.1090001@mind.be>
 <CA+BsyQ5a01JK7Cb7GoZK9jkhsPDHTx0NE0j3YHCde=HMPdXoJQ@mail.gmail.com>
 <56100FFC.6020805@mind.be>
Message-ID: <CA+BsyQ5oKZe_xJWXaT+bUx5-Q=s7Tuz_37O7OX4+v1eJOOS5qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> So my approach has been to aim at building a set of patches knowing
>> that they are not likely to be integrated, meaning we can focus on
>> keeping the maintenance as simple as possible on the buildroot side.
>
>  Well, no, diverging from upstream makes maintenance harder, not simpler.

I don't see how we have a choice when it comes to older GCC releases.
Making a relatively big change to trunk and backporting it is going to
be a more invasive change in this case. But it's academic, as I think
we agree in any case that the more comprehensive approach (ie doing
the detection of symbols only and getting rid of all the other checks)
might be best in the long run.

>> What do you think of the idea of doing a wholesale change that gets
>> rid of the entire check and simply uses the check for the helper
>> functions ?
>
>  As mentioned above, I think that that is the better approach, but it's really
> worthwhile to discuss this upstream as well.

Okay. I will do that next before submitting any further patches here.

regards

Brendan
