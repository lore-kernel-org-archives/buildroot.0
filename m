From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 28 Oct 2014 10:17:38 +0400
Subject: [Buildroot] [PATCH] package/schifra: move -o option from OPTIONS to
	build commands
Message-ID: <1414477058-3382-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows redefining OPTIONS w/o risk of having too many or too few -o
in the end of it.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/schifra/0001-fix-makefile-options.patch |  119 +++++++++++++++++++++++
 1 files changed, 119 insertions(+), 0 deletions(-)
 create mode 100644 package/schifra/0001-fix-makefile-options.patch

diff --git a/package/schifra/0001-fix-makefile-options.patch b/package/schifra/0001-fix-makefile-options.patch
new file mode 100644
index 0000000..c8395e9
--- /dev/null
+++ b/package/schifra/0001-fix-makefile-options.patch
@@ -0,0 +1,119 @@
+Move -o option from OPTIONS to build commands
+
+This allows redefining OPTIONS w/o risk of having too many or too few -o
+in the end of it.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+
+--- schifra-0.0.1/Makefile	1999-12-31 17:00:00.000000000 +0300
++++ schifra-0.0.1/Makefile.new	2014-10-28 10:07:19.000000000 +0400
+@@ -22,7 +22,7 @@
+ 
+ COMPILER         = -c++
+ OPTIMIZATION_OPT = -O3
+-OPTIONS          = -ansi -pedantic-errors -Wall -Wextra -Werror -Wno-long-long -lstdc++ $(OPTIMIZATION_OPT) -o
++OPTIONS          = -ansi -pedantic-errors -Wall -Wextra -Werror -Wno-long-long -lstdc++ $(OPTIMIZATION_OPT)
+ 
+ HPP_SRC+=schifra_galois_field_polynomial.hpp
+ HPP_SRC+=schifra_galois_field.hpp
+@@ -70,76 +70,76 @@
+ 	./schifra_reed_solomon_speed_evaluation
+ 
+ schifra_reed_solomon_codec_validation: schifra_reed_solomon_codec_validation.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_codec_validation schifra_reed_solomon_codec_validation.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_codec_validation schifra_reed_solomon_codec_validation.cpp
+ 
+ schifra_reed_solomon_speed_evaluation: schifra_reed_solomon_speed_evaluation.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_speed_evaluation schifra_reed_solomon_speed_evaluation.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_speed_evaluation schifra_reed_solomon_speed_evaluation.cpp
+ 
+ schifra_reed_solomon_file_encoding_example: schifra_reed_solomon_file_encoding_example.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_file_encoding_example schifra_reed_solomon_file_encoding_example.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_file_encoding_example schifra_reed_solomon_file_encoding_example.cpp
+ 
+ schifra_reed_solomon_file_decoding_example: schifra_reed_solomon_file_decoding_example.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_file_decoding_example schifra_reed_solomon_file_decoding_example.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_file_decoding_example schifra_reed_solomon_file_decoding_example.cpp
+ 
+ schifra_reed_solomon_example01: schifra_reed_solomon_example01.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_example01 schifra_reed_solomon_example01.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_example01 schifra_reed_solomon_example01.cpp
+ 
+ schifra_reed_solomon_example02: schifra_reed_solomon_example02.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_example02 schifra_reed_solomon_example02.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_example02 schifra_reed_solomon_example02.cpp
+ 
+ schifra_reed_solomon_example03: schifra_reed_solomon_example03.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_example03 schifra_reed_solomon_example03.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_example03 schifra_reed_solomon_example03.cpp
+ 
+ schifra_reed_solomon_example04: schifra_reed_solomon_example04.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_example04 schifra_reed_solomon_example04.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_example04 schifra_reed_solomon_example04.cpp
+ 
+ schifra_reed_solomon_example05: schifra_reed_solomon_example05.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_example05 schifra_reed_solomon_example05.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_example05 schifra_reed_solomon_example05.cpp
+ 
+ schifra_reed_solomon_example06: schifra_reed_solomon_example06.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_example06 schifra_reed_solomon_example06.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_example06 schifra_reed_solomon_example06.cpp
+ 
+ schifra_reed_solomon_example07: schifra_reed_solomon_example07.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_example07 schifra_reed_solomon_example07.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_example07 schifra_reed_solomon_example07.cpp
+ 
+ schifra_reed_solomon_example08: schifra_reed_solomon_example08.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_example08 schifra_reed_solomon_example08.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_example08 schifra_reed_solomon_example08.cpp
+ 
+ schifra_interleaving_example01: schifra_interleaving_example01.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_interleaving_example01 schifra_interleaving_example01.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_interleaving_example01 schifra_interleaving_example01.cpp
+ 
+ schifra_interleaving_example02: schifra_interleaving_example02.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_interleaving_example02 schifra_interleaving_example02.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_interleaving_example02 schifra_interleaving_example02.cpp
+ 
+ schifra_interleaving_example03: schifra_interleaving_example03.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_interleaving_example03 schifra_interleaving_example03.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_interleaving_example03 schifra_interleaving_example03.cpp
+ 
+ schifra_reed_solomon_file_interleaving_example: schifra_reed_solomon_file_interleaving_example.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_file_interleaving_example schifra_reed_solomon_file_interleaving_example.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_file_interleaving_example schifra_reed_solomon_file_interleaving_example.cpp
+ 
+ schifra_bitio_example01: schifra_bitio_example01.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_bitio_example01 schifra_bitio_example01.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_bitio_example01 schifra_bitio_example01.cpp
+ 
+ schifra_bitio_example02: schifra_bitio_example02.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_bitio_example02 schifra_bitio_example02.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_bitio_example02 schifra_bitio_example02.cpp
+ 
+ schifra_erasure_channel_example01: schifra_erasure_channel_example01.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_erasure_channel_example01 schifra_erasure_channel_example01.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_erasure_channel_example01 schifra_erasure_channel_example01.cpp
+ 
+ schifra_erasure_channel_example02: schifra_erasure_channel_example02.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_erasure_channel_example02 schifra_erasure_channel_example02.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_erasure_channel_example02 schifra_erasure_channel_example02.cpp
+ 
+ schifra_reed_solomon_gencodec_example: schifra_reed_solomon_gencodec_example.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_gencodec_example schifra_reed_solomon_gencodec_example.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_gencodec_example schifra_reed_solomon_gencodec_example.cpp
+ 
+ schifra_reed_solomon_product_code_example : schifra_reed_solomon_product_code_example.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_product_code_example schifra_reed_solomon_product_code_example.cpp
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_product_code_example schifra_reed_solomon_product_code_example.cpp
+ 
+ schifra_reed_solomon_threads_example01: schifra_reed_solomon_threads_example01.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_threads_example01 schifra_reed_solomon_threads_example01.cpp -pthread -lboost_thread
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_threads_example01 schifra_reed_solomon_threads_example01.cpp -pthread -lboost_thread
+ 
+ schifra_reed_solomon_threads_example02: schifra_reed_solomon_threads_example02.cpp $(HPP_SRC)
+-	$(COMPILER) $(OPTIONS) schifra_reed_solomon_threads_example02 schifra_reed_solomon_threads_example02.cpp -pthread -lboost_thread
++	$(COMPILER) $(OPTIONS) -o schifra_reed_solomon_threads_example02 schifra_reed_solomon_threads_example02.cpp -pthread -lboost_thread
+ 
+ clean:
+ 	rm -f core.* *.o *.bak *stackdump *~
-- 
1.7.7.6
