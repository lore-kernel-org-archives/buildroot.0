From: Benno <b.schweikert@prosystems.de>
Date: Tue, 3 Nov 2015 16:11:59 +0100
Subject: [Buildroot] Poco 1.6.1 with glib for Raspberry Pi
In-Reply-To: <20151103160203.187da1ba@free-electrons.com>
References: <56388339.6080904@prosystems.de>
 <20151103151918.1aa989ea@free-electrons.com> <5638CBAE.9040700@prosystems.de>
 <20151103160203.187da1ba@free-electrons.com>
Message-ID: <5638CEBF.1030502@prosystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> This is unclear. Can you give the *exact* commands you are running
> using the example program above to get the problem ?

for compiling:
path/to/buildroot/output/host/usr/bin/arm-buildroot-linux-gnueabi-g++ 
-O0 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"src/Example.d" 
-MT"src/Example.d" -o "src/Example.o" "../src/Example.cpp"

for linking:
path/to/output/host/usr/bin/arm-buildroot-linux-gnueabi-g++ 
-L/path/to/buildroot/output/target/usr/lib -o "ExampleProj" 
./src/Example.o   -lPocoFoundation -lPocoUtil -lPocoNet


> Yes, the fact that you use glibc is useful. But it does not answer my
> question which was: "what do you mean by FPEnvironment?"

The FPEnvironment is for floating points.

Am 03.11.2015 um 16:02 schrieb Thomas Petazzoni:
> Dear Benno,
>
> On Tue, 3 Nov 2015 15:58:54 +0100, Benno wrote:
>
>>> Can you give us a sample program that allows us to reproduce the
>>> problem ?
>> I tried to make an example program...
>>
>> #include <string>
>>
>> int main(int argc, char **argv)
>> {
>>       std::string example = "This is a test string";
>>
>>       return 0;
>> }
> Unless I'm wrong this example program is *not* using the Poco libraries.
>
>> I linked the Poco libraries Foundation, Util and Net. Then I compiled it.
>> When the linker is invoked I got the same errors again....
> This is unclear. Can you give the *exact* commands you are running
> using the example program above to get the problem ?
>
>>> Is the sentence incomplete? "for the FPEnvironment" doesn't really mean
>>> anything.
>> I thought its an important info that I use glibc.
> Yes, the fact that you use glibc is useful. But it does not answer my
> question which was: "what do you mean by FPEnvironment?"
>
> Thomas

-- 
Mit freundlichen Gr??en / with best regards


Benno Schweikert


ProSystems GmbH, Am Forst 26, D-74889 Sinsheim Eschelbach
Tel.: ++49(0)7265 / 911239
Amtsgericht Mannheim HRB 341508
Gesch?ftsf?hrer: Dipl.-Ing. Dietmar Nikolaj, Michael Doll, Ralf Rostock

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151103/6153393a/attachment.html>
