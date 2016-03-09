From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 16:06:48 +0100
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <56E038BC.6060300@mind.be> (Arnout Vandecappelle's message of
 "Wed, 9 Mar 2016 15:52:44 +0100")
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
 <87a8m721lk.fsf@dell.be.48ers.dk> <56E02D83.9020402@zacarias.com.ar>
 <871t7j205g.fsf@dell.be.48ers.dk> <56E03522.8060609@mind.be>
 <87wppbzp3k.fsf@dell.be.48ers.dk> <56E038BC.6060300@mind.be>
Message-ID: <87oaanzo53.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

>> well, if executed throyh a shell it will - But if I write code to call
 >> execve I get to chose what argv[0] should be.

 >  Read the section "Interpreter scripts" of execve(2). argv[0] is discarded.

Ahh yes, for a script this would be true because of the shebang handling
in the kernel, but it is not true for normal ELF binaries.

>> That's another reason. If somebody does a symlink to our wrapper, then
 >> $0 will contain the full path to the link, not to the wrapper
 >> itself.

 >  So we need to readlink it first.

Yes, or read /proc/self/exec.

 >> If somebody does a hardlink, /proc/self/exe won't even fix it for you -
 >> But that is probably quite unlikely.

 >  For the hardlink case there is no solution.

Indeed.

-- 
Venlig hilsen,
Peter Korsgaard 
