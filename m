From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 11 Dec 2015 16:55:09 +0100
Subject: [Buildroot] [RFC] Relocatable host tools
In-Reply-To: <20151211162850.327b9e71@free-electrons.com>
References: <CAAXf6LX2uJ7p+SzdZq2LKL0JsHXB0PzO_1Lx5tTjcBfDq-7wZg@mail.gmail.com>
 <20151211162850.327b9e71@free-electrons.com>
Message-ID: <CAAXf6LWo1kud7n4pxUcd+yuU7Pz-BpaDF+ipv3Mwh4dZmjgvEA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 11, 2015 at 4:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thomas,
>
> On Fri, 11 Dec 2015 15:11:27 +0100, Thomas De Schampheleire wrote:
>
>> I believe this is one step closer to having a relocatable host SDK for
>> Buildroot. While I'm not claiming (nor have I tested) a completely
>> relocatable host SDK, by changing the RPATH from an absolute path to
>> '$ORIGIN/../lib'.
>>
>> '$ORIGIN' here is a literal string encoded in the ELF binary and
>> replaced at runtime by the location of the binary. So, a binary
>> originally created in /home/foo/buildroot/output/host/usr/bin and run
>> from there will expect its libraries in
>> /home/foo/buildroot/output/host/usr/lib, but the same binary copied
>> and run from /tmp/hostsdk/bin will expect its libraries in
>> /tmp/hostsdk/lib.
>
> Have you seen:
>
>   http://patchwork.ozlabs.org/patch/494781/
>   http://patchwork.ozlabs.org/patch/494782/
>   http://patchwork.ozlabs.org/patch/494783/
>   http://patchwork.ozlabs.org/patch/494784/
>   http://patchwork.ozlabs.org/patch/494785/
>

Ah, clearly not! Thanks for the reference.
(I did search in my gmail, but had deleted old mails a while back)

Are there blocking issues with these patches? There are still some
open comments on v5 but no objections in that iteration.
(I haven't reviewed the code myself yet).

Samuel, could you also share your view on the status of these patches?
Are you planning a new iteration with Baruch's comments fixed?

Thanks,
Thomas
