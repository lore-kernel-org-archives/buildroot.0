From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 14:21:39 +0100
Subject: [Buildroot] [PATCH v6] testing/infra: split runtime test from
 BRTest
In-Reply-To: <1549358791-19797-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Tue, 5 Feb 2019 03:26:31 -0600")
References: <1549358791-19797-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87o97qnzfg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
 > Move the setup of emulator to a new class, RuntimeTestBase, that bahaves

s/bahaves/behaves/

 > exactly like BRTest currently does.
 > It will avoid duplicating code when adding a common class to test the
 > git download infra.

Sorry for the late feedback, but wouldn't it be a lot simpler/more
pragmatic to keep the BRTest name for the "common" case, and instead add
a new parent class with all the common stuff.

E.G.:

BaseTest <-- GitTest <- ..
           |
            - BRTest <-- TestATop
                      |
                       - TestDropbear
                      |
                       - ...

I agree that RuntimeTestBase is maybe a nicer name, but BRTest for
something where we run a Buildroot output under qemu isn't really bad
either IMHO.

-- 
Bye, Peter Korsgaard
