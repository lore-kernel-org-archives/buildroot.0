From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 19 Jul 2011 08:52:07 +0200
Subject: [Buildroot] [PATCH 1/2] Allow rebuilding of generic targets.
In-Reply-To: <20110719070526.44b8f083@skate>
References: <1310980553-20754-1-git-send-email-quotientvremainder@gmail.com>
 <1310980553-20754-2-git-send-email-quotientvremainder@gmail.com>
 <20110719070526.44b8f083@skate>
Message-ID: <CAAXf6LWqq4vPq8ST-LoheSR=eKy+0sjr4ydZXbLFB=cMXLCqrQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Jul 19, 2011 at 7:05 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Mon, 18 Jul 2011 10:15:52 +0100,
> Quotient Remainder <quotientvremainder@gmail.com> a ?crit :
>
>> Individual packages using the GENTARGETS and AUTOTARGETS infrastructure
>> can now be rebuilt by issuing "make ${pkg}-rebuild".
>> Changes can be made in output/build/${pkg}/* and make ${pkg}-rebuild will
>> run the normal build command for that directory again.
>>
>> Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>
>
> I also have a patch (below) that implements a similar feature
> (<pkg>-rebuild and <pkg>-reconfigure), but it also does the "make"
> again automatically as well to regenerate the root filesystem. The
> implementation is a bit different, as it doesn't use a new fake stamp
> file, but simply uses phony targets.

Has this patch already been applied?

I like the fact that rebuild and reconfigure are waterfall steps that
continue to the regeneration of the root filesystem. This was also my
last comment for Quotient's reconfigure (in the discussion of PATCH
0/2).

I'll leave it up to you and Quotient to agree upon which patch
implementation makes it through...

Best regards,
Thomas
