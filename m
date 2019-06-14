From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Jun 2019 09:58:47 +0200
Subject: [Buildroot] [PATCH v3 2/3] autobuild-run: initial
 implementation of do_reproducible_build()
In-Reply-To: <20190613201358.GL2647@scaer>
References: <20190611123416.11533-1-itsatharva@gmail.com>
 <20190611123416.11533-2-itsatharva@gmail.com> <20190613201358.GL2647@scaer>
Message-ID: <ddb67691-4212-9b76-1a34-74622dfe8ee3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13/06/2019 22:13, Yann E. MORIN wrote:
> Atharva, All,
> 
> On 2019-06-11 18:04 +0530, Atharva Lele spake thusly:
[snip]
>> +    # Clean up build 1
>> +    f = open(os.path.join(outputdir, "logfile"), "w+")
>> +    subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "clean"], stdout=f, stderr=f)
> 
> Since we do create a small Makefile wrapper in $(O), you could simplify
> this a little with:
> 
>     subprocess.call(["make", "-C", outputdir, "clean"], stdout=f, stderr=f)
> 
> Ditto in the existing do_build() function. Can be improved upon when you
> introduce the Builder class.

 This is bikeshedding, obviously, but I don't like that proposal. I think an
explicit O= -C is easier to read and understand.

 Shorter is not better :-)

 Regards,
 Arnout
