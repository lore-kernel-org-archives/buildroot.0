From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 15 Oct 2015 11:14:07 +0200
Subject: [Buildroot] =?utf-8?q?host_=C3=A2ckage_empty_dependency_list?=
In-Reply-To: <20151014181336.GO2451@tarshish>
References: <561E71EB.5080801@green-communications.fr>
 <20151014181336.GO2451@tarshish>
Message-ID: <561F6E5F.9070709@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Baruch

On 14/10/2015 20:13, Baruch Siach wrote:
> Hi Sylvain,
> 
> On Wed, Oct 14, 2015 at 05:16:59PM +0200, Sylvain Raybaud wrote:
>> I'd like the host variant of a package to have no dependency at
>> all, while its target variant has some. Specifying an empty list
>> with
>> 
>> HOST_FOO_DEPENDENCIES = ""
>> 
>> gives me an error. Not setting HOST_FOO_DEPENDENCY or setting 
>> HOST_FOO_DEPENDENCIES =
>> 
>> makes it inherit the dependencies of target variant. Is there a
>> way to achieve this?
> 
> This is weird. Existing packages (e.g. tar, tcl, libcap, etc.)
> have
> 
> HOST_LIBCAP_DEPENDENCIES =
> 
> and it seems to work for them. Please post the full .mk file, and
> the build error message.
> 
> baruch
> 

Sorry, you're right, probably some other packages happened to select
the same dependencies as my package. I tried adding an exotic
dependency to my package and no host variant of it was built. Sorry
for the noise.

Cheers,

Sylvain


- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJWH25fAAoJEEkkwl4JtJ9yKgsP/RhsqqL9+lhZfEELBV0shAZ2
BDSMqtO/Ctx/k3dw/wM8zKINT0H0ELiB3Ywg1nC8AEKsIuoI5nzLimE8kS9vRxQe
1xLoNhqeWYmIrCJQ1f8uoIQaYkcz6uxwTVThB5XTuukOrG8FG1j88zs0xQywU3ri
lnuQfUtx9A7FRO3qK17QFEv0xzAiysTt61GClJzreoL6Q5hXk2eqHjumoKE2M32A
0ICSA8VKOhMa0R0i3bKYZiKC60/3ap1L6hIFM/QpnkKXXgIZm6O8/LTZGCqtsi8d
5tyH+/dT3ALeDZwrvufk8idVMPk8vxE5YMM6t07YbFtHJiiOaSAqnXcNMCw2kKk+
xF3cX7a1x6e8XRjucaPqVIazT0OwQNFBAH871luA8E1n7qPx/FzbaeoEzKfqUUGo
8yYIfT319fldyV8wWSqcT0gkkH987QYp8XxzPwCqnr1TM8hGx16/4HGICLmh+/cE
jOfhnJEwPsuJ9Hr/RP/EvlXO7jAZVKQZAoyq0YwntUAWoR+qceuRqUL2D595iDGy
DVz4oGv8Gy8eT/Ss1/Qa7UpKH79kHrIyvfiJCXsmUxNf3vCjQbM8N7Zp/ZsqdNZl
MvjuM90oBcyJzXA8CEp2rtxzxejbKFFU+8vlSO+Zi4LYQJp15aBlX3RTTknO5ccl
1MTy4f4oopOfkqwBsEea
=zY7d
-----END PGP SIGNATURE-----
