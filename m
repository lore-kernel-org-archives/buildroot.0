From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Feb 2019 15:29:06 +0100
Subject: [Buildroot] [PATCH v6] testing/infra: split runtime test from
 BRTest
In-Reply-To: <87o97qnzfg.fsf@dell.be.48ers.dk>
References: <1549358791-19797-1-git-send-email-matthew.weber@rockwellcollins.com>
 <87o97qnzfg.fsf@dell.be.48ers.dk>
Message-ID: <f4c84d5e-a554-c1c8-0ead-6fe2d47db8b0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05/02/2019 14:21, Peter Korsgaard wrote:
>>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:
> 
>  > From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
>  > Move the setup of emulator to a new class, RuntimeTestBase, that bahaves
> 
> s/bahaves/behaves/
> 
>  > exactly like BRTest currently does.
>  > It will avoid duplicating code when adding a common class to test the
>  > git download infra.
> 
> Sorry for the late feedback, but wouldn't it be a lot simpler/more
> pragmatic to keep the BRTest name for the "common" case, and instead add
> a new parent class with all the common stuff.
> 
> E.G.:
> 
> BaseTest <-- GitTest <- ..
>            |
>             - BRTest <-- TestATop
>                       |
>                        - TestDropbear
>                       |
>                        - ...
> 
> I agree that RuntimeTestBase is maybe a nicer name, but BRTest for
> something where we run a Buildroot output under qemu isn't really bad
> either IMHO.

 I thought of that as well, but then I thought that it would be confusing to add
a superclass. But I hadn't figured out that BRTest would indeed refer to tests
doing a full Buildroot build.

 BaseTest is not that great, though. BRConfigTest maybe? That more accurately
reflects what it does, I think.

 Regards,
 Arnout
