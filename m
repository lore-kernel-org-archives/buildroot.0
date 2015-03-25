From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Mar 2015 11:07:29 -0300
Subject: [Buildroot] [Bug-readline] IPython/readline segfaults
In-Reply-To: <5512BF40.5000702@vu.nl>
References: <55116D12.1000106@vu.nl> <5511B114.60704@case.edu>
 <20150325003203.GL10761@vapier> <5512940B.60808@vu.nl>
 <5512B650.1020006@zacarias.com.ar> <5512BF40.5000702@vu.nl>
Message-ID: <5512C121.7040707@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/25/2015 10:59 AM, ir. Tjeerd Pinkert wrote:

> On 25-03-15 14:21, Gustavo Zacarias wrote:
>> On 03/25/2015 07:55 AM, ir. Tjeerd Pinkert wrote:
>>
>>> Thanks, indeed, buildroot 2015.02 has 6.3 with no patches, although it
>>> downloads the latest tar file. I'm trying to see if patching helps.
>>
>> I've sent a patch to bump it to patchlevel 8 after the 2015.02 release
>> for another bug in commit b817e8c58117402561a61c0d749337f415c9c985
>> (bash-related).
>> So it'll be part of the 2015.05 release, or if you're in a rush just
>> apply that patch to your tree.
> 
> I have tested it, and the patch works, no more segfaults so far.
> 
> I attach the patch file for buildroot, Gustavo, can you tell me if I did
> it in a correct way? Did you already include this one in buildroot too?
> I could not get the original patch working with the buildroot system so
> I generated my own diff which works for buildroot (that is
> readline-0001-63-002.patch). I saw there are more patches for readline
> 6.3 available.

Hi.
No need to CC Mike or the readline list, as far as they're concerned
this was already fixed with the patches upstream.
Well, it's easy, fetch the patch:

$ wget
"http://git.buildroot.net/buildroot/patch/?id=b817e8c58117402561a61c0d749337f415c9c985"
-O readline.patch

Apply the patch:

buildroot-2015.02 $ patch -p1 <readline.patch

And yes, the patches need a little tweak to apply cleanly (the patch
prefixing is done in a somewhat odd way), but i've handled that in the
patch i've sent for buildroot inclusion.
Regards.
