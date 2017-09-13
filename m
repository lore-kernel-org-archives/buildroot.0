From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Sep 2017 22:43:39 +0200
Subject: [Buildroot] [PATCH] package/lzo: Set CMAKE_INSTALL_LIBDIR for
 host variant explicitly
In-Reply-To: <CAHXCMMKe5KiGHCP4H4vBMj+kzpFOTDgE5HBWDTJHLOGpFaR9Uw@mail.gmail.com>
References: <20170913173724.6157-1-andrew.smirnov@gmail.com>
 <CAHXCMMKe5KiGHCP4H4vBMj+kzpFOTDgE5HBWDTJHLOGpFaR9Uw@mail.gmail.com>
Message-ID: <acb86c77-9bcb-2fc2-82a9-0e79a267edfc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 20:55, Samuel Martin wrote:
> Hi Andrey,
> 
> On Wed, Sep 13, 2017 at 7:37 PM, Andrey Smirnov
> <andrew.smirnov@gmail.com> wrote:
>> Building host-lzo on 64-bit Fedora 26 ends up with library files
>> installed into $(HOST_DIR)/lib64 instead of $(HOST_DIR)/lib where
>> other packages (at least host-mtd) depending on it would look for it
>> (resulting in build failures). Fix that by specifying the directory to
>> be lib/ explicitly.

 It would be good to find out why this happens. I don't see anything in
CMakeLists.txt that could explain this.

 Does this happen with the Buildroot-built host-cmake or only when you use the
system-installed one?

 I expect this will happen with all host-cmake packages... Could you check?

 Obviously, we need a more fundamental solution than this.

>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> 
> Acked-by: Samuel Martin <s.martin49@gmail.com>

 Nacked by me, we need a more fundamental fix.


> 
>> ---
>>
>> I suspect this might not be the best solution for this problem, but it
>> is a good starting point to discuss what might be and that's why I
>> submitted this patch anyway.
> 
> Indeed the infra could certainly create the symlink $(HOST_DIR)/lib64
> -> lib (or  $(HOST_DIR)/lib32 -> lib).

 That could be a solution, but I don't like it very much... OTOH we do this for
staging/target already so why not for host.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
