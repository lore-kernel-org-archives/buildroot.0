From: Grzegorz Blach <grzegorz@blach.pl>
Date: Thu, 30 Aug 2018 12:20:41 +0200
Subject: [Buildroot] [PATCH 2/2] python-falcon: new package
In-Reply-To: <20180830093128.5d1f5837@windsurf>
References: <20180828101618.4746-1-grzegorz@blach.pl>
 <20180828101618.4746-2-grzegorz@blach.pl>
 <CAMWSM7jvM=oqzCns6RAx32RDDdnFF0ikvhMjXdDCPRoB_d27cA@mail.gmail.com>
 <20180829214758.718d5e7f@windsurf>
 <CAMWSM7gW28RJsfcBOFO4dGE4sEVncv4GRvxa3n_X8YQfXa_wDw@mail.gmail.com>
 <20180830093128.5d1f5837@windsurf>
Message-ID: <39837a67-fd6e-4df5-6678-2781ca7ca475@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/30/2018 09:31 AM, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 29 Aug 2018 14:58:34 -0700, Joseph Kogut wrote:
> 
>> Cython allows Python modules to be written using a mix of Python and C
>> or C++ syntax with optional static typing. During setup, Cython
>> modules are transpiled to C or C++ and compiled normally as Python
>> extensions. Most projects that use Cython, including Falcon, have
>> implementations in vanilla Python, as well as Cython.
>>
>> Based on my experience porting Kivy, having Cython available on the
>> host should be enough to compile the extensions.
> 
> Thanks for the explanation/introduction about Cython!
> 
>> As I noted in my message after this one, I can't think of a reason to
>> not *always* depend on host-cython here. Compiling the extensions is
>> essentially an optimization step.
>>
>> The only reason I can think of to not compile the extensions is if
>> performance isn't a concern, and you don't have the requisite build
>> environment during setup.
> 
> A principle in Buildroot is to avoid adding mandatory dependencies if
> they are optional. So if people want the extra optimizations provided
> by Cython, they should enable Cython, and python-falcon should
> optionally depend on it.
> 
> Will you send a patch doing this ?

I've just sent a patch.


> 
> Thanks!
> 
> Thomas
> 
