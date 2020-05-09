From: Andreas Ziegler <br015@umbiko.net>
Date: Sat, 09 May 2020 19:20:38 +0000
Subject: [Buildroot] Help: debug binary in build_root
In-Reply-To: <CACEFAc09yq+y0W1anXNOfHuVbE3z0kTrz37YLu9=F-gwCckJaQ@mail.gmail.com>
References: <mailman.7.1589025603.138573.buildroot@busybox.net>
 <3c88b9e7b58476542e54ae0e13f175b5@umbiko.net>
 <CACEFAc09yq+y0W1anXNOfHuVbE3z0kTrz37YLu9=F-gwCckJaQ@mail.gmail.com>
Message-ID: <dbb5f17540820b6e0f7d0952e0a793ab@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Kunal,

On 2020-05-09 18:06, Kunal Chauhan wrote:
> Hi team ,
> 
> 1. I have not done static code analysis before, no experience , would
> you give some hint.?

Static code analysis looks at the source code and tries to find 
anomalies. Wikipedia has a list of possible tools, some commercial, some 
open source. The only one I have used is SonarQube, but it is mainly 
used in CI/CD environments, not stand-alone.

Save this for later.

> 2. If i have a log till where the program shows prints and after that
> logs is not come as binary carshes.  Will it will be help ful in
> static analysis and i can narrow down my debugging.?

Try to narrow down the crash location. Instrument your code by putting 
more debug information inside. If that fails, use gdb. You could use the 
existing Buildroot project to compile the necessary binaries and then 
copy them manually to your target system.

Kind regards,
Andreas
