From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 23:09:20 +0100
Subject: [Buildroot] [PATCH 1/1] package/mbedtls: security bump to
 version 2.6.10
In-Reply-To: <20210312202133.10544-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 12 Mar 2021 21:21:33 +0100")
References: <20210312202133.10544-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8feu773.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix a buffer overflow in mbedtls_mpi_sub_abs() when calculating
 >   |A| - |B| where |B| is larger than |A| and has more limbs (so the
 >   function should return MBEDTLS_ERR_MPI_NEGATIVE_VALUE). Only
 >   applications calling mbedtls_mpi_sub_abs() directly are affected:
 >   all calls inside the library were safe since this function is
 >   only called with |A| >= |B|.
 > - Fix an errorneous estimation for an internal buffer in
 >   mbedtls_pk_write_key_pem(). If MBEDTLS_MPI_MAX_SIZE is set to an odd
 >   value the function might fail to write a private RSA keys of the
 >   largest supported size.
 > - Fix a stack buffer overflow with mbedtls_net_poll() and
 >   mbedtls_net_recv_timeout() when given a file descriptor that is
 >   beyond FD_SETSIZE.
 > - Guard against strong local side channel attack against base64 tables
 >   by making access aceess to them use constant flow code.

 > https://github.com/ARMmbed/mbedtls/releases/tag/v2.16.10

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x, 2020.11.x and 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
