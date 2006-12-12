From: Bernhard Fischer <rep.nop@aon.at>
Date: Tue, 12 Dec 2006 10:02:02 +0100
Subject: [Buildroot] ARM softfloat patch for gcc 4.2
In-Reply-To: <406186.89354.qm@web35612.mail.mud.yahoo.com>
References: <20061210141537.GD4442@aon.at>
	<406186.89354.qm@web35612.mail.mud.yahoo.com>
Message-ID: <20061212090202.GB5002@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Dec 11, 2006 at 11:32:53PM -0800, Andre wrote:
>Bernhard Fischer <rep.nop@aon.at> wrote:
>> On Fri, Dec 08, 2006 at 07:21:14PM -0800, Andre wrote:
>> >Tested with gcc 4.2 20061205 snapshot + binutils 2.17
>> >
>> >Seems to work with one minor issue: although the newly created
>> >arm-linux-uclibc-gcc defaults to -mfloat-abi=soft, binutils does
>> not.
>> 
>> There are (at least) two upstream bugs about arm softfloat:
>> gcc.gnu.org/PR16314
>> gcc.gnu.org/PR14352
>> 
>> Richard is the arm arch maintainer, so please discuss the problems
>> there and also fix it there. thanks,
>> 
>
>Not quite sure I follow you... the issue with binutils seems likely
>to be in binutils or in the way buildroot configures and builds
>binutils, or not ??
>
>The gcc bugs you reference seem to be unrelated...

Did you read the PRs mentioned above? Especially the thread mentioned in
PR16314, comment #1 ?

If binutils defaults to not creating softfloat code in a toolchain that
was ment to be softfloat-(only?), then that sounds like a glitch, yes.
Does that work as expected with 2.17.50.0.8?
