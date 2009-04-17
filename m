From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Fri, 17 Apr 2009 09:19:19 -0500
Subject: [Buildroot] Properly setting up hotplug
In-Reply-To: <873ac79yf4.fsf@macbook.be.48ers.dk>
References: <35AF1D2435E24FA6B1C89344B22D099E@apexjs>
	<d6cda7730904170152o5bfccb10u56409f747d8f1783@mail.gmail.com>
	<873ac79yf4.fsf@macbook.be.48ers.dk>
Message-ID: <6C09CA91-9038-415C-937F-8B9BC7058CE6@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 17, 2009, at 8:56 AM, Peter Korsgaard wrote:

>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> Hi,
>
> Thiago> I don't like distclean because it will remove the downloaded  
> files,
>
> Only if you have it set as BASE_DIR/dl. I expect most people who use
> BR on a regular schedule to store their downloads somewhere else.

I would argue then that, conceptually, for BR there should be two  
forms of distclean:

1) to clean up the projects files (i.e. as if you did 'make distclean'  
for directfb)

2) to clean up ALL of BR (i.e. clean up BR for shipment)

The reasoning is that distclean for a package is DIFFERENT than  
distclean for BR - for obvious reasons.

I understand the desire to keep the same underpinnings (since we all  
know about clean and distclean for particular packages) but because BR  
is not about ONE package but many, I think it is conceptually  
stretched, possibly, to the point of failure. Or worse - that saying  
"distclean" means two different things to two different people.

I would argue two types of distclean - package and BR. Now, how to  
implement them I leave up to the experts.

Look forward to my book "The Philosophical Underpinnings of DistClean  
and Why The Guardrails of the Abyss Have Been Removed"

Cheers,

Lloyd
